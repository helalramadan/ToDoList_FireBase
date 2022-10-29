import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/Shared/Constans/constans.dart';
import 'package:todolist/global_cubit/cubit.dart';
import 'package:todolist/models/model_social.dart';

Future navigetorAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Future navigetorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget defultTextForm({
  required TextEditingController textController,
  required TextInputType type,
  Function? onTap,
  Function? onChange,
  Function? onSubmet,
  required Function validator,
  Function? suffixPressed,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  required bool isPass,
}) =>
    TextFormField(
      controller: textController,
      keyboardType: type,
      obscureText: isPass,
      onTap: onTap != null ? onTap() : null,
      onChanged: onChange != null ? (s) => onChange(s) : null,
      onFieldSubmitted: onSubmet != null ? (s) => onSubmet(s) : null,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        label: Text(lable),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defultButton({
  required Function onPressed,
  double width = double.infinity,
  Color backgraound = Colors.orange,
  required String text,
  bool isUppercase = true,
  double radius = 3.0,
}) =>
    Container(
      height: 50,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: backgraound,
        borderRadius: BorderRadius.circular(radius),
      ),
    );

void showTost({required String msg, required TostState state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: changeColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum TostState { SUCCESS, ERROR, WARNING }

Color changeColor(TostState state) {
  Color color;
  switch (state) {
    case TostState.SUCCESS:
      color = Colors.green;
      break;
    case TostState.ERROR:
      color = Colors.red;
      break;
    case TostState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget BuildTaske(TodoUserModle model, context) => Dismissible(
      key: Key(model.Id.toString()),
      onDismissed: (direction) {
        // To_Cubit.get(context).DeletDataBase(id: model["id"]);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.orange), // color: Colors.teal[300],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.0,
              ),
              Checkbox(
                value: To_Cubit.get(context).isCheked,
                onChanged: (value) {
                  To_Cubit.get(context).chekedBox(value);
                },
                checkColor: defaultMainColor,
              ),
              SizedBox(
                width: 25.0,
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),
                        Text('${model.time}', textAlign: TextAlign.center),
                        Text(
                          '${model.title}',
                          style: TextStyle(
                              decoration: To_Cubit.get(context).isCheked
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('${model.date}', textAlign: TextAlign.center),
                        SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Edit'.toUpperCase(),
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.alarm))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget defultTextFormFild({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  required Function validator,
  Function? onSubmit,
  Function? onChage,
  Function? onTap,
  required String lable,
  IconData? prefix,
  IconData? suffix,
  Function? fsuffix,
}) =>
    TextFormField(
      validator: (value) => validator(value),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: () {
        onTap!();
      },
      onFieldSubmitted: onSubmit != null ? (s) => onSubmit(s) : null,
      onChanged: onChage != null ? (s) => onChage(s) : null,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: () {
            fsuffix!();
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  Color backgraound = Colors.blue,
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
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model.time}'),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model.titel}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '${model.date}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            IconButton(
              iconSize: 30.0,
              onPressed: () {
                // To_Cubit.get(context)
                //     .UpdateDataBase(status: "done", id: model["id"]);
              },
              icon: const Icon(
                Icons.check_box,
                color: Color.fromARGB(255, 0, 140, 255),
              ),
            ),
            IconButton(
              onPressed: () {
                // To_Cubit.get(context)
                //     .UpdateDataBase(status: "arcived", id: model["id"]);
              },
              iconSize: 30.0,
              icon: const Icon(
                Icons.archive,
                color: Colors.black38,
              ),
            )
          ],
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

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Shared/Companent/companent.dart';
import 'package:todolist/global_cubit/cubit.dart';
import 'package:todolist/global_cubit/cubitstat.dart';

class Done_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<To_Cubit, To_State>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: To_Cubit.get(context).notesDone.isNotEmpty,
          builder: (context) => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              To_Cubit.get(context).isCheked.add(false);
              return BuildTaske(
                  To_Cubit.get(context).notesDone[index],
                  To_Cubit.get(context).isCheked[index], //done taskes
                  context,
                  index);
            },
            separatorBuilder: (context, int index) => Container(
              height: 1,
              // width: double.infinity,
              // color: Colors.grey,
            ),
            itemCount: To_Cubit.get(context).notesDone.length,
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.architecture_sharp,
                  color: Colors.grey,
                  size: 45.0,
                ),
                Text("hello")
              ],
            ),
          ),
        );
      },
    );
  }
}

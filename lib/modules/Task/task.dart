import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todolist/Shared/Companent/companent.dart';
import 'package:todolist/global_cubit/cubit.dart';
import 'package:todolist/global_cubit/cubitstat.dart';

class Task_Screen extends StatelessWidget {
  @override
  // To_Cubit taskes = To_Cubit.get(context);
  Widget build(context) {
    return BlocConsumer<To_Cubit, To_State>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: To_Cubit.get(context).notes.isNotEmpty,
          builder: (context) => ListView.separated(
            itemBuilder: (BuildContext context, int index) => BuildTaske(
              To_Cubit.get(context).notes[index],
              context,
            ),
            separatorBuilder: (context, int index) => Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            itemCount: To_Cubit.get(context).notes.length,
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

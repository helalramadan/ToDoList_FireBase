import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/global_cubit/cubit.dart';
import 'package:todolist/global_cubit/cubitstat.dart';
import 'package:todolist/modules/login/todo_login.dart';
import 'package:todolist/new_task.dart';

class Home extends StatelessWidget {
  @override
  var scafoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  // List<Map> taskes = []; error

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<To_Cubit, To_State>(
      listener: (BuildContext context, state) {
        if (state is InsertDataBase_state) {
          // Navigator.pop(context);
          //
          // titleController.text = "";
          //
          // dateController.text = "";
          //
          // timeController.text = "";
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          key: scafoldKey,
          appBar: AppBar(
            title: const Text(
              "To Do App",
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoLoginScreen()));
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewTask()));
            },
            child: Icon(
              Icons.add,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                To_Cubit.get(context).change(index);
              },
              currentIndex: To_Cubit.get(context).curentindex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done_outline_rounded), label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: "Active"),
              ]),
          body: To_Cubit.get(context).Screen[To_Cubit.get(context).curentindex],
        );
      },
    );
  }
}

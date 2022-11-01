import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Shared/Constans/constans.dart';
import 'package:todolist/global_cubit/cubitstat.dart';
import 'package:todolist/models/model_social.dart';
import 'package:todolist/modules/Active/active.dart';

import 'package:todolist/modules/Done/done.dart';
import 'package:todolist/modules/Task/task.dart';

class To_Cubit extends Cubit<To_State> {
  To_Cubit() : super(Inisional_state());

  static To_Cubit get(context) => BlocProvider.of(context);

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  int curentindex = 0;

  // late Database dataBase;
  List<Widget> Screen = [Task_Screen(), Done_Screen(), Active_Screen()];
  void change(index) {
    curentindex = index;
    emit(Change_state());
  }

  List<bool> isCheked = [];
  void chekedBox(int index, value) {
    isCheked[index] = !isCheked[index];
    emit(ChekedBoxState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  void creatUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    TodoUserModle model = TodoUserModle(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        image:
            'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg',
        cover:
            'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg',
        // bio: 'Write Your Bio .....',
        isCheked: false);
    emit(CreatUserLoadingState());
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreatUserSuccessState());
    }).catchError((error) {
      emit(CreatUserErrorState(error.toString()));
    });
  }

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      creatUser(email: email, name: name, phone: phone, uId: value.user!.uid);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changeIcon() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangeState());
  }

  bool isBottomSheetShown = false;
  IconData fabicon = Icons.edit;

  void changeBouttonSheet(bool issheet, IconData icon) {
    isBottomSheetShown = issheet;
    fabicon = icon;
    emit(Change_state());
  }

//data base local
  void DeletDataBase({
    required int id,
  }) {
    // dataBase.rawDelete('DELETE FROM taskes WHERE id = ?', [id]).then((value) {
    //   getDataBase(dataBase);
    //   emit(DeletDataBase_state());
    // });
  }

  void UpdateDataTask({
    required String title,
    required String time,
    required String date,
    bool isCheked = false,
  }) {
    TodoUserModle modelUpdate =
        TodoUserModle(title: title, time: time, date: date, isCheked: isCheked);
    FirebaseFirestore.instance
        .collection("notes")
        .doc(uId)
        .collection('note')
        .doc()
        .update(
          modelUpdate.toMap(),
        )
        .then((value) {
      emit(UpdateDataBase_state());
    });
  }

  void UpdateDataBase({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    TodoUserModle modelUpdate = TodoUserModle(
      title: name,
      email: email,
      phone: phone,
      uId: uId,
      image:
          'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg',
      cover:
          'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg',
      // bio: 'Write Your Bio .....',
    );
    FirebaseFirestore.instance
        .collection("notes")
        .doc(uId)
        .set(modelUpdate.toMap(), SetOptions(merge: true))
        .then((value) {
      emit(UpdateDataBase_state());
    });
  }

  insertDataBase({
    required String title,
    required String time,
    required String date,
    bool isCheked = false,
  }) {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(uId)
        .collection('note')
        .doc()
        .set({
      'title': title,
      'time': time,
      'date': date,
    }).then((value) {
      emit(GetDataBase_state());
      getDataBase();
    });
  }

  TodoUserModle? userModleNote;
  List<TodoUserModle> notes = [];
  List<TodoUserModle> notesDone = [];
  List<TodoUserModle> notesActive = [];
  void getDataBase() {
    emit(GetLoadingDataBase_state());
    FirebaseFirestore.instance
        .collection('notes')
        .doc(uId)
        .collection('note')
        // .doc()
        .snapshots()
        .listen((event) {
      notes = [];
      event.docs.forEach((element) {
        notes.add(TodoUserModle.fromJson(element.data()));
        // event.data()!.values.forEach((element) {
        //   notes.add(TodoUserModle.fromJson(element));
        // });
      });

      notesDone = [];
      // event.docs.where((element) => isCheked == true).forEach((element) {
      //   notesDone.add(TodoUserModle.fromJson(element.data()));
      // });
    });

    emit(GetDataBase_state());
  }
}

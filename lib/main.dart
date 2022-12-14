import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Shared/Constans/constans.dart';
import 'package:todolist/Shared/cache_helper.dart';
import 'package:todolist/global_cubit/cubit.dart';
import 'package:todolist/modules/Home/home.dart';
import 'package:todolist/modules/login/todo_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();
  Widget widget;
  uId = CacheHelper.getBoolean(key: 'uId');

  if (uId != null) {
    widget = Home();
  } else {
    widget = TodoLoginScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget StatWidget;
  const MyApp(this.StatWidget) : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => To_Cubit()..getDataBase(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: StatWidget,
      ),
    );
  }
}

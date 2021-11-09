import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_project/bloc/border_color_bloc/border_color_bloc.dart';
import 'package:image_project/bloc/title_bloc/title_bloc.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=> TitleBloc()),
          BlocProvider(create: (BuildContext context)=> BorderColorBloc())
        ],
        child: Home(),
      ),
    );
  }
}


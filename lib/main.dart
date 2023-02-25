import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_app/src/cubit/test_cubit.dart';
import 'package:task_app/src/page/demo.dart';
import 'package:task_app/src/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TestCubit>(
          create: (_) => TestCubit()..loadJsonData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        // home: BlocProvider(
        //   create: (context) => TestCubit()..loadJsonData(),
        //   child: HomePage(),
        // ),
      ),
    );
  }
}

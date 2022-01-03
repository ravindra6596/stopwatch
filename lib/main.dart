import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: const Scaffold(
        /*   appBar: AppBar(
          title: const Text('StopWatch'),
        ), */
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: AspectRatio(
              aspectRatio: 0.85,
              child: StopWatch(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samples_bloc/blocs/counter_with_bloc.dart';
import 'package:samples_bloc/blocs/user_bloc.dart';
import 'package:samples_bloc/pages/bloc_counter.dart';
import 'package:samples_bloc/pages/bloc_user.dart';
import 'package:samples_bloc/widgets/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BLoC Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        // bloc: CounterBloC(),
        // child: BlocCounterPage(),
        bloc: UserBloC(),
        child: BlocUserPage(),
      ),
    );
  }
}

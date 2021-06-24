import 'dart:async';

import 'package:samples_bloc/widgets/bloc_provider.dart';

class CounterBloC implements BlocBase {
  int _counter;

  //Streams for handling the counter..For use within this class only i.e why(_)
  StreamController<int> _counterController = StreamController<int>();
  //Getter Sink (LHS) for the input
  Sink<int> get _inCounter => _counterController.sink;
  //Getter Stream (RHS) for the output...(without _)
  Stream<int> get outCounter => _counterController.stream;

  //Streams for handling the increment of the counter..Copy these two lines and create another fxn
  StreamController<int> _incrementController = StreamController<int>();
  Sink<int> get incrementCounter => _incrementController.sink;

  //Constructor..._incrementController listens to the function...
  CounterBloC() {
    _counter = 0;
    _incrementController.stream.listen(_increment);
  }

  @override
  void dispose() {
    _counterController.close();
    _incrementController.close();
  }

  //Real Logic lies here...
  void _increment(data) {
    _counter = _counter + 1;
    _inCounter.add(_counter);
  }
}

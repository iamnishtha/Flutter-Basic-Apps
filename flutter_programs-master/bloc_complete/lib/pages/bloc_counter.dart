import 'package:flutter/material.dart';
import 'package:samples_bloc/blocs/counter_with_bloc.dart';
import 'package:samples_bloc/widgets/bloc_provider.dart';

class BlocCounterPage extends StatefulWidget {
  BlocCounterPage({Key key}) : super(key: key);

  @override
  _BlocCounterPageState createState() => _BlocCounterPageState();
}

class _BlocCounterPageState extends State<BlocCounterPage> {
  @override
  Widget build(BuildContext context) {
    //Get the CounterBloc for the stream...VVIP STEP...
    final CounterBloC counterBloc = BlocProvider.of<CounterBloC>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Button pushed :'),
            // Text('$_counter', style: Theme.of(context).textTheme.display1)
            StreamBuilder<int>(
              initialData: 0,
              stream: counterBloc.outCounter,
              builder: (_, __) {
                return Text('${__.data}',
                    style: Theme.of(context).textTheme.display1);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: true,
        onPressed: () {
          counterBloc.incrementCounter.add(null);
        },
      ),
    );
  }
}

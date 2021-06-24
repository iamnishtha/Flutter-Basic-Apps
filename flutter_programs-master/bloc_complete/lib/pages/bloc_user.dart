import 'package:flutter/material.dart';
import 'package:samples_bloc/blocs/user_bloc.dart';
import 'package:samples_bloc/models/user.dart';
import 'package:samples_bloc/widgets/bloc_provider.dart';
import 'package:samples_bloc/widgets/cut_corners_border.dart';

class BlocUserPage extends StatefulWidget {
  @override
  _BlocUserPageState createState() => _BlocUserPageState();
}

class _BlocUserPageState extends State<BlocUserPage> {
  @override
  Widget build(BuildContext context) {
    //VVIP...
    final UserBloC userBloc = BlocProvider.of<UserBloC>(context);
    String _newName;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //A Stream can only be supplied to one at a time...
            StreamBuilder<User>(
              initialData: User.empty(),
              stream: userBloc.outUser,
              builder: (_, AsyncSnapshot<User> snapshot) {
                return Text('${snapshot.data.name}',
                    style: Theme.of(context).textTheme.display1);
              },
            ),
            StreamBuilder<User>(
              initialData: User.empty(),
              stream: userBloc.outUser,
              builder: (_, AsyncSnapshot<User> snapshot) {
                return Container(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    onChanged: (value) => _newName = value,
                    decoration: InputDecoration(
                      labelText: snapshot.data.name,
                      border: CutCornersBorder(
                        borderSide: BorderSide()
                      )
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: true,
        onPressed: () {
          userBloc.updateName.add(_newName);
        },
      ),
    );
  }
}

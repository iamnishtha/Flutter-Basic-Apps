import 'dart:async';

import 'package:samples_bloc/models/user.dart';
import 'package:samples_bloc/widgets/bloc_provider.dart';
import 'package:samples_bloc/api/db.dart';

class UserBloC implements BlocBase {
  User _user;

  //Streams to handle the user
  StreamController<User> _userController = StreamController<User>.broadcast();//VVIp

  Sink<User> get _inUser => _userController.sink;
  Stream<User> get outUser => _userController.stream;

  //Streams to handle actions on the user
  StreamController<User> _updateUserController = StreamController<User>();
  Sink<User> get updateUser => _updateUserController.sink;

  //Streams to handle input of a new name...
  StreamController<String> _updateNameController = StreamController<String>();
  Sink<String> get updateName => _updateNameController.sink;

  UserBloC() {
    dbApI.getUser().then((user) {
      _user = user;
      _inUser.add(_user);
    });
    _updateUserController.stream.listen(_updateUser);
    _updateNameController.stream.listen(_updateName);
  }

  @override
  void dispose() {
    _userController.close();
    _updateUserController.close();
    _updateNameController.close();
  }

  void _updateUser(User user) {
    _user = user;
    _inUser.add(_user);
  }

  void _updateName(String name) {
    _user.name = name;
    _inUser.add(_user);
  }
}

import 'package:samples_bloc/models/user.dart';

class DBApI {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));
    User _user = User('Aseem', 25, 150);
    return _user;
  }
}

DBApI dbApI = DBApI();

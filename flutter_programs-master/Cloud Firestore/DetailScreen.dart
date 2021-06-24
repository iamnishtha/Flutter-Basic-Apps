import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DetailScreen extends StatefulWidget {
  final String title = 'Detail Screen';
  final FirebaseUser loggedInUser;
  final GoogleSignInAccount user;
  final Firestore fInstance = Firestore.instance;
  DetailScreen({Key key, @required this.loggedInUser, this.user})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ArticlesScreen();
  }
}

class ArticlesScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        // automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: widget.fInstance.collection('flutter').snapshots(),
        builder: (_, __) {
          if (!__.hasData) {
            return const Text('Loading data');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: GoogleUserCircleAvatar(
                  identity: widget.user,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBody(BuildContext ctxt, DocumentSnapshot docSnapshot) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Text(docSnapshot['like'].toString()),
            title: Text(docSnapshot['name']),
            subtitle: Text(docSnapshot['date'].toString()),
            trailing: Text(docSnapshot['dislike'].toString()),
          ),
          
        ],
      ),
    );
  }
}

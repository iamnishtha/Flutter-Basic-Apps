import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main.dart'; //important fix

class DetailedScreen extends StatelessWidget {
  final UserInfoDetails detailsUser;

  // DetailedScreen({
  //   Key key}) : super(key: key);

  DetailedScreen({Key key, @required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Twitter Sign In Details'),
          automaticallyImplyLeading: false,
        ),
        body: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Text(
                "Name : " + detailsUser.displayName,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),              
              new Text(
                "isAnonymous : " + detailsUser.isAnonymous.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new Text(
                "isEmailVerified : " + detailsUser.isEmailVerified.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new Text(
                "Photo URL : " + detailsUser.photoUrl,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new Text(
                "Provider ID : " + detailsUser.providerId,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new Text(
                "UiD : " + detailsUser.uid,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ), 
              new Text(
                "My Profile Pic",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.2,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),                           
              new Image.network(
                detailsUser.photoUrl,
                colorBlendMode: BlendMode.dstIn,
              )
            ],
          ),
        )
        );
  }
}

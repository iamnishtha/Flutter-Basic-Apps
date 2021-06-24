import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;

  Crashlytics.instance.setUserEmail('YOUR EMAIL');
  Crashlytics.instance.setUserName('YOUR USER NAME');
  Crashlytics.instance.setUserIdentifier('YOUR USER IDENTIFIER');

  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crashlytics example app'),
        ),
        body: Center(
          child: Column(
            children: [
              FlatButton(
                child: const Text('Key'),
                onPressed: () {
                  Crashlytics.instance.setString('foo', 'bar');
                },
              ),
              FlatButton(
                child: const Text('Log'),
                onPressed: () {
                  Crashlytics.instance.log('baz');
                },
              ),
              FlatButton(
                child: const Text('Crash'),
                onPressed: () {
                  // Use Crashlytics to throw an error. Use this for
                  // confirmation that errors are being correctly reported.
                  Crashlytics.instance.crash();
                },
              ),
              FlatButton(
                child: const Text('Throw Error'),
                onPressed: () {
                  // Example of thrown error, it will be caught and sent to
                  // Crashlytics.
                  throw StateError('Uncaught error thrown by app.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

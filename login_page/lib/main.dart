import 'package:flutter/material.dart';
import 'package:login_page/aws.dart';
import 'package:login_page/facebook.dart';
import 'package:login_page/google.dart';
import 'package:login_page/secret.dart';

void main() => runApp(MyApp());
signInFacebook() async {
  final facebookLoginResult = await signInWithFacebook();
  final credentials = new Credentials(
    cognitoIdentityPoolId,
    cognitoUserPoolId,
    cognitoClientId,
    facebookLoginResult.accessToken.token,
    'graph.facebook.com',
  );

  final api = Api(apiEndpointUrl, '/flutter', 'ap-southeast-2', credentials);

  final result = await api.post({});

  print(result.body);
}

signInGoogle() async {
  final googleSignInAuthentication = await signInWithGoogle();
  final credentials = new Credentials(
    cognitoIdentityPoolId,
    cognitoUserPoolId,
    cognitoClientId,
    googleSignInAuthentication.idToken,
    'accounts.google.com',
  );

  final api = Api(apiEndpointUrl, '/flutter', 'ap-southeast-2', credentials);

  final result = await api.post({});

  print(result.body);
}
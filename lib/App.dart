import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logindemowithtest/LoginPage.dart';
import 'package:logindemowithtest/auth.dart';
import 'package:logindemowithtest/auth_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthProvider(auth: Auth(),
        child: MaterialApp(
          home: LoginPage(onSignIn: ()=>false,),
        ));
  }
}

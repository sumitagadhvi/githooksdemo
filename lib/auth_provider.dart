import 'package:flutter/cupertino.dart';
import 'package:logindemowithtest/auth.dart';

class AuthProvider extends InheritedWidget{
 const AuthProvider({required this.auth,required Widget child}) : super(child: child);
  final BaseAuth auth;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget)=>true;
  static AuthProvider? Function({Object? aspect}) of(BuildContext context){
   return context.dependOnInheritedWidgetOfExactType<AuthProvider>;
  }
}
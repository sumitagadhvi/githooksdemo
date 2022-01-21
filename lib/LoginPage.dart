import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logindemowithtest/HomePage.dart';
import 'package:logindemowithtest/auth.dart';
import 'package:logindemowithtest/auth_provider.dart';
import 'package:logindemowithtest/validation.dart';
enum FormType {
  login,
  register,
}
class LoginPage extends StatefulWidget {
  late VoidCallback onSignIn;
   LoginPage({Key? key, required this.onSignIn}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formkey=GlobalKey();
  FormType formType=FormType.login;
 String _email='';
  String _password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Form(
        key: formkey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: Key('email'),
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                validator: Validator().emailValidator,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                key: Key('password'),
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: Validator().passwordValidator,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    validateAndSubmit();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                },
                  child: Text('Login'),
                  key: Key('signIn'),
              )
            ],
          )
      ),
      ),
    );
  }
  bool validateAndSave(){
    final FormState? form=formkey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }
  Future<void> validateAndSubmit()async{
    if(validateAndSave()){
      try{
        final BaseAuth auth=AuthProvider.of(context).call()!.auth;
        if(formType==FormType.login){
          final String userId=await auth.signInWithEmailAndPassword(_email, _password);
          print('Signin=$userId');
        }else{
          final String userId=await auth.createUserWithEmailAndPassword(_email, _password);
          print('Signup=$userId');
        }
      }catch (e){
        print('error=$e');
      }
    }
  }

  void moveToRegister() {
    formkey.currentState!.reset();
    setState(() {
      formType = FormType.register;
    });
  }

  void moveToLogin() {
    formkey.currentState!.reset();
    setState(() {
      formType = FormType.login;
    });
  }
  }

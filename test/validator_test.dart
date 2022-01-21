import 'package:flutter_test/flutter_test.dart';
import 'package:logindemowithtest/validation.dart';
void main(){
  test('test empty emailfield', (){
    final result=Validator().emailValidator('');
    expect(result, 'Email cant be empty');
  });
  test('test nonempty emailField', (){
    final result=Validator().emailValidator('email');
    expect(result, '');
  });
  test('test empty password', (){
    final result =Validator().passwordValidator('');
    expect(result, 'Password cant be empty');
  });
  test('test nonempty passwordFiled', (){
    final result=Validator().passwordValidator('password');
    expect(result, '');
  });
}
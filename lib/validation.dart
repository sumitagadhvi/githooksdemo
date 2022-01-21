class Validator{
  String? emailValidator(String? value){
    return value!.isEmpty?'Email cant be empty':'';
  }
  String? passwordValidator(String? value){
    return value!.isEmpty?'Password cant be empty':'';
  }
}
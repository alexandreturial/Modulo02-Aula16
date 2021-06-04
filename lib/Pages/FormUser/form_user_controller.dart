import 'package:aula18/Pages/FormUser/form_user_model.dart';

class FormController{
  FormModel model = FormModel();

  setName(String name){
    model.setName(name);
  }

  setLast(String name){
    model.setLastName(name);
  }

  String get name => model.fullname();
  
  Future<String> get fullName => model.getFullName();

  void saveUser(){
    model.saveuser();
  }

  void deleteUser(){
    model.deleteUser();
  }
}
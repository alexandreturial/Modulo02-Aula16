import 'package:aula18/Pages/FormUser/form_user_model.dart';

class FormController{
  FormModel model = FormModel();

  setName(String name){
    model.setName(name);
  }

  setLast(String name){
    model.setLastName(name);
  }

  String get completName => model.fullname();

  Future<String> get name => model.name();

  Future<String> get lastName => model.lastName();
  
  Future<String> get fullName => model.getFullName();

  void saveUser(){
    model.saveuser();
  }
}
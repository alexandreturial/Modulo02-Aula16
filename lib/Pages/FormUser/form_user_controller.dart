import 'dart:async';

import 'package:aula18/Pages/FormUser/form_user_model.dart';
import 'package:aula18/Pages/FormUser/user.dart';

class FormViewModel {
  FormModel model = FormModel();


  String get name => model.fullname();
  
  //Future<String> get fullName => model.getFullName();

  StreamController<User> user = StreamController();

  void getUser(){
    model.currentUser().then((value){
      user.add(value);
      print(user);
      
    });
  }

  void saveUser(String name, String suerName){
    model.saveuser(name,  suerName);
   
  }

  void deleteUser(){
    model.deleteUser();
  }
}
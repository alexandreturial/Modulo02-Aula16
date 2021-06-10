import 'dart:async';

import 'package:aula18/Pages/FormUser/form_user_model.dart';
import 'package:aula18/Pages/FormUser/user.dart';

class FormViewModel {
  FormModel model = FormModel();
  FormViewModel(){
  getUser();
  }

  String get name => model.fullname();
  
  StreamController<User> user = StreamController();

  getUser(){
    model.currentUser();
    model.user.then((value){
      user.add(value);
    });
  }


  void saveUser(String name, String suerName){
    model.saveuser(name,  suerName);
    model.currentUser();
  }

  void deleteUser(){
    model.deleteUser();
  }
}
import 'dart:async';

import 'package:aula18/Pages/FormUser/form_user_model.dart';
import 'package:aula18/Pages/FormUser/user.dart';

class FormViewModel {
  FormModel model = FormModel();


  String get name => model.fullname();
  
  //Future<String> get fullName => model.getFullName();

  StreamController<User> user = StreamController();

  getUser(){
     model.currentUser();
    model.user.then((value){
      user.add(value);
    });
  }

  // User getUser(){
  //   return model.currentUser();
  // }

  void saveUser(String name, String suerName){
    model.saveuser(name,  suerName);
    model.currentUser();
    // model.user.then((value){
    //   print('ID: ${value.rowid}, name: ${value.name} r');
    //   user.add(value);
    // });
    //model.currentUser();
  }

  void deleteUser(){
    model.deleteUser();
  }
}
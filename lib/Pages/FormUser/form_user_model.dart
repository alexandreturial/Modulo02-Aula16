import 'package:aula18/Pages/FormUser/user.dart';
import 'package:aula18/sql/sql_adapter.dart';
import 'package:aula18/storage/secure_storage_adapter.dart';
import 'package:aula18/storage/shared_preferences_adapter.dart';
import 'package:aula18/utils/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormModel{
  String? name;
  String? lastName;
  final InternalStorageAdpter internalStorage;

  FormModel({InternalStorageAdpter? intenralStorageAdapter}) 
  : internalStorage = intenralStorageAdapter ?? SQLAdapter();

  setName(String val){
    name = val;
  }

  setLastName(String val){
    lastName = val;
  }

  String fullname(){
    if((name != null) && (lastName != null)){
      
      return '$name $lastName';
    }else{
      return 'sem nome';
    }
  }

  Future<User> currentUser(){
    return internalStorage.getUser();
  }

  void saveuser(String name, String suerName){
    internalStorage.saveUser(name, suerName);
  }

  void deleteUser(){
    internalStorage.deleteUser();
  }

}

import 'package:aula18/storage/secure_storage_adapter.dart';
import 'package:aula18/storage/shared_preferences_adapter.dart';
import 'package:aula18/utils/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormModel{
  String? name;
  String? lastName;
  final InternalStorageAdpter internalStorage;

  FormModel({InternalStorageAdpter? intenralStorageAdapter}) 
  : internalStorage = intenralStorageAdapter ?? SecureStorageAdapter();

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

  Future<String> getFullName(){
    return internalStorage.getFullName();
  
  }

  void saveuser(){
    if((name == null) || (lastName == null)) return;
    internalStorage.saveUser(name!, lastName!);
  
  }

}
import 'package:aula18/storage/secure_storage_adapter.dart';
import 'package:aula18/storage/shared_preferences_adapter.dart';
import 'package:aula18/utils/internal_storage.dart';

class FormModel{
  String? _name;
  String? _lastName;
  InternalStorageAdpter? internalStorage;

  FormModel({InternalStorageAdpter? intenralStorageAdapter}){
      internalStorage = intenralStorageAdapter ?? SecureStorageAdapter();
      
      internalStorage!.getName().then((value){
       _name = value;
      });

      internalStorage!.getLasName().then((value){
       _lastName = value;
      });

  } 


  setName(String val){
    _name = val;
   saveNameForm();
  }

  setLastName(String val){
    _lastName = val;
    saveLastNameForm();
  }

  Future<String> name() {
    return internalStorage!.getName();
  }

  Future<String> lastName(){ 
    return internalStorage!.getLasName();
  }

  String fullname(){
    if((_name != null) && (_lastName != null)){
      
      return '$_name $_lastName';
    }else{
      return 'sem nome';
    }
  }

  Future<String> getFullName(){
    return internalStorage!.getFullName();
  
  }

  void saveuser(){
    if((_name == null) || (_lastName == null)) return;
    internalStorage!.saveUser(_name!, _lastName!);
  }

  void saveNameForm(){
    if((_name == null)) return;
    internalStorage!.saveNameForm(_name!);
  }

  void saveLastNameForm(){
    if((_lastName == null)) return;
    internalStorage!.saveLastNameForm(_lastName!);
  }

}
import 'package:aula18/Pages/FormUser/form_user_model.dart';
import 'package:aula18/utils/internal_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Find in internal storage test', (){
    final model = FormModel(intenralStorageAdapter: MockStorage());
    model.setName('xande');
    model.setLastName("Turial");

    model.saveuser();
    model.getFullName();

    expect(model.name, 'xande');

    
    expect(model.lastName, 'Turial'); 

  });
}

class MockStorage extends InternalStorageAdpter{
  String? nameStorage;
  String? lastnameStorage;

  @override
  Future<String> getFullName() {
    if((nameStorage != null) && (lastnameStorage != null)){
      final fullName = nameStorage! + ' ' + lastnameStorage!;
      return Future.value(fullName);
    }else{
      return Future.value('Usuário não existe');
    }
  }

  @override
  void saveUser(String name, String lastName) {
    nameStorage = name;
    lastnameStorage = lastName;
  }
  
}
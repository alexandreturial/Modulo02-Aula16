import 'package:aula18/Pages/FormUser/user.dart';
import 'package:aula18/utils/internal_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter extends InternalStorageAdpter{
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  void saveUser(String name, String lastName)async{
    await secureStorage.write(key: 'name', value: name);
    await secureStorage.write(key: 'lastname', value: lastName);
    print('dados seguros');
  }

  

  Future<String> getFullName() async{
    String? name = await secureStorage.read(key: 'name');
    String? lastname = await secureStorage.read(key: 'lastname');

    if((name != null) && (lastname != null))
      return name + ' ' + lastname;
    else{
      return 'Usuário não existe';
    }
  }
  @override
  void saveNameForm(String name) async{
    await secureStorage.write(key: 'form_name', value: name);
    print('name form savo!');
  }

  @override
  void saveLastNameForm(String lastName) async{
    await secureStorage.write(key: 'form_lastname', value: lastName);
    print('lastName form savo!');
  }

  @override
  Future<String> getName() async{
    String? name = await secureStorage.read(key: 'form_name');

    if((name != null))
      return name;
    else{
      return 'sem nome';
    }
  }

  @override
  Future<String> getLasName() async{
    String? lastname = await secureStorage.read(key: 'form_lastname');

    if((lastname != null))
      return lastname;
    else{
      return 'sem nome';
    }
  }

  @override
  void deleteUser() {
    // TODO: implement deletUser
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
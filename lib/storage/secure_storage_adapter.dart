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
}
import 'package:aula18/Pages/FormUser/user.dart';
import 'package:aula18/utils/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdpter{
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void saveUser(String name, String lastName) async{
    final internalPref = await _pref;
    internalPref.setString('name', name);
    internalPref.setString('lastname', lastName);
    print('Dados Salvos!');
  }

  Future<String> getFullName() async{
    final internalPref = await _pref;

    String? name = internalPref.getString('name');
    String? lastname = internalPref.getString('lastname');

    if((name != null) && (lastname != null))
      return name + ' ' + lastname;
    else{
      return 'Usuário não existe';
    }
  }

  @override
  void saveNameForm(String name) async{
    final internalPref = await _pref;
    internalPref.setString('form_name', name);
    print('name form savo!');
  }

  @override
  void saveLastNameForm(String lastName) async{
    final internalPref = await _pref;
    internalPref.setString('form_lastname', lastName);
    print('lastName form savo!');
  }

  @override
  Future<String> getName() async{
    final internalPref = await _pref;

    String? name = internalPref.getString('name');

    if((name != null))
      return name;
    else{
      return '';
    }
  }

  @override
  Future<String> getLasName() async{
     final internalPref = await _pref;

    String? lastname = internalPref.getString('lastname');

    if((lastname != null))
      return lastname;
    else{
      return '';
    }
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  void deleteUser() {
    // TODO: implement deleteUser
  }
}
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
}
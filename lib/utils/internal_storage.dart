import 'package:aula18/Pages/FormUser/user.dart';

abstract class InternalStorageAdpter{
  void saveUser(String name, String lastName);
  
  Future<User> getUser();

  void deleteUser();
}
abstract class InternalStorageAdpter{
  void saveUser(String name, String lastName);
  
  void saveNameForm(String name);

  void saveLastNameForm(String lastname);

  void deleteUser();

  Future<String> getFullName();

  Future<String> getName();

  Future<String> getLasName();
}
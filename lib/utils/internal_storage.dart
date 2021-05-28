abstract class InternalStorageAdpter{
  void saveUser(String name, String lastName);
  
  Future<String> getFullName();
}
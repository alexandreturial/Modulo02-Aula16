import 'package:aula18/Pages/FormUser/user.dart';
import 'package:aula18/utils/internal_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdpter{
  static Database? _database;

   Future<Database> get database async{
      if(_database != null){
        return _database!;
      }

      _database = await initDB();
      print(_database?.path);
      return _database!;
    }

  initDB() async{
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(
      path, 
      onCreate: (db, version){
        return db.execute("CREATE TABLE Users(name TEXT, surname TEXT)");
      },
      version: 1);
  }

  @override
  Future<User> getUser() async{
    final Database db = await database;
    
    var response = await db.query(
      'Users', 
      columns: ['rowid, name, surname'],
      orderBy: 'rowid DESC',
      limit: 1
    );

    if(response.isNotEmpty){
      final user = User.fromMap(response.first);
      return user;
    }else{
      User user = User(0,'', '');
      return user;
    }
  }

  @override
  void saveUser(String name, String lastName) async{
    // TODO: implement saveUser
    final Database db = await database;
    var user = {
      'name': name,
      'surname': lastName
    };
    await db.insert('Users', user);
    print('usuario salvo');
  }

  void deleteUser() async{
    // TODO: implement saveUser
    final Database db = await database;
    db.rawDelete(
      'DELETE FROM Users WHERE rowid = (SELECT MAX(rowid) FROM Users)'
    );
    
    // delete(
    //   'Users', 
    //   where: 'SELECT MAX(id) FROM Users',
    // );
  }
}
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
  Future<String> getFullName() async{
    final Database db = await database;
    var response = await db.query(
      'Users', 
      columns: ['rowid, name, surname'],
      where: 'rowid = ?',
      whereArgs: [3]
    );

    if(response.isNotEmpty){
      final user = User.fromMap(response.first);
      return user.rowid.toString() + ' ' + user.name + ' ' + user.surname;
    }else{
      return 'Usuario não encontrado';
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

  void deletUser(int userId) async{
    // TODO: implement saveUser
    final Database db = await database;
    db.delete(
      'Users', 
      where: 'rowid = ?',
      whereArgs: [userId]
    );
  }
}
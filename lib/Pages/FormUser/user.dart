class User{
  int rowid;
  String name;
  String surname;

  User(this.rowid, this.name, this.surname);

  User.fromMap(Map<String, dynamic> map) :
    rowid = map['rowid'],
    name = map['name'],
    surname = map['surname'];

  Map<String, dynamic> toMap(){
    return {
      'rowid': rowid,
      'name' : name,
      'surname': surname
    };
  }
}
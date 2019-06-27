class UserModel {
 int id;
 String username;
 String name;
 String password;
 String role;

  UserModel({this.id, this.name, this.username, this.password, this.role});

  // UserModel.map(dynamic obj) {
  //   this.id = obj['id'];
  //   this.username = obj['title'];
  //   this._description = obj['description'];
  // }

  factory UserModel.fromDatabaseJson(Map<String, dynamic> data) => UserModel(
      id        : data['id'],
      name      : data['name'],
      username  : data['username'],
      password  : data['password'],
      role      : data['role']
  );

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id        : data['id'],
      name      : data['name'],
      username  : data['username'],
      password  : data['password'],
      role      : data['role']
    );
    // this.id     = data['id'];
    // this.name     = data['name'];
    // this.username     = data['username'];
    // this.password     = data['password'];
    // this.role     = data['role'];
  }

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id'        : id,
      'username'  : username,
      'name'      : name,
      'password'  : password,
      'role'      : role
    };
  }
}

class UserArguments {
  int id;
  String username;
  String name;
  String password;
  String role;
  int totalData;

  UserArguments({this.id, this.name, this.username, this.password, this.role, this.totalData});
}

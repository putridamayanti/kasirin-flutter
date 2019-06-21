class UserModel {
  final int id;
  final String username;
  final String name;
  final String password;
  final String role;

  UserModel({this.id, this.name, this.username, this.password, this.role});

  factory UserModel.fromDatabaseJson(Map<String, dynamic> data) => UserModel(
      id        : data['id'],
      name      : data['name'],
      username  : data['username'],
      password  : data['password'],
      role      : data['role']
  );

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

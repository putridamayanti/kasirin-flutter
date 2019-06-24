import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/models/user_model.dart';
import 'package:kasirin_flutter/repository/user_repository.dart';
import 'package:kasirin_flutter/screens/user/form_user_screen.dart';
import 'package:kasirin_flutter/styles/color_style.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _UserState();
  }

}

class _UserState extends State<UserScreen> {

  List users = new List();

  void initState() {
    super.initState();

    getAllUser();
  }

  getAllUser() {
    UserRepository().getAllUser().then((result) {
      // print(result);
      this.setState(() {
        // result.map((user) {
        //   print(user);
        //   users.add(UserModel.fromMap(user));
        // });
        result.forEach((user) {
          print(user);
          // UserModel.fromMap(user).toString()
          users.add(UserModel.fromMap(user));
        });
      });
    });
  }

  Widget CardList(id, name, username, password, role) {
    return Card(
      color: ColorStyle.dark,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormUserScreen(),
              // Pass the arguments as part of the RouteSettings. The
              // ExtractArgumentScreen reads the arguments from these
              // settings.
              settings: RouteSettings(
                arguments: UserArguments(
                  id: id,
                  name: name,
                  username: username,
                  password: password,
                  role: role
                ),
              ),
            ),
          );
//          Navigator.pushNamed(context, '/form/user', arguments: {
//            id: id,
//            name: name,
//            role: role
//          });
        },
        child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(name, style: TextStyle(color: Colors.white, fontSize: 18.0),),
                Text(role, style: TextStyle(color: Colors.white24),)
              ],
            ),
            Icon(
                    Icons.edit,
                    color: Colors.white30,
                  )
          ],
        ),
      ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.darkBlue,
      drawer: DrawerComponent(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 65.0),
              child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: users != null ? users.length : 0,
                          itemBuilder: (BuildContext context, int index){
                            // print(users[index]);
                            return CardList(users[index].id, users[index].name, users[index].username, users[index].password, users[index].role);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            )
          ),
          HeaderComponent(title: 'Pengguna', gradient1: ColorStyle.darkBlue, gradient2: ColorStyle.darkBlue),
        ],
      )
    );
  }

}

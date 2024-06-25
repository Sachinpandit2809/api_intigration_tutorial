// import "dart:convert";

// import "package:api_intigration_tutorial/Models/post_model.dart";
// import "package:api_intigration_tutorial/Models/user_model.dart";
// import "package:flutter/material.dart";
// import "package:http/http.dart" as http;

// class UsersScreen extends StatefulWidget {
//   const UsersScreen({super.key});

//   @override
//   State<UsersScreen> createState() => _UsersScreenState();
// }

// class _UsersScreenState extends State<UsersScreen> {
//   List<UserModel> userList = [];
//   Future<List<UserModel>> getUserApi() async {
//     var response =
//         await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (var i in data) {
//         userList.add(UserModel.fromJson(i));
//       }
//       return userList;
//     } else {
//       return userList;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("userModel"),
//         backgroundColor: Colors.amber,
//       ),
//       body: Expanded(
//         child:Column(
//           children: [
//              FutureBuilder(
//               future: getUserApi(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return CircularProgressIndicator();
//                     }else{
//                                     ListView.builder(
//                         itemCount: userList.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               Text("sachin"),
//                             ],
//                           );
//                         });
//                     }

//                   }),
//           ],
//         )
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:api_intigration_tutorial/Models/post_model.dart';
import 'package:api_intigration_tutorial/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(////////////////*-+
      appBar: AppBar(
        title: Text('User Model'),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: getUserApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(snapshot.data![index].name.toString()),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

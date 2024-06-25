

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
    return Scaffold(
      ////////////////*-+
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
                  return Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.amber,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" COMPONY :-" +
                            snapshot.data![index].company.toString()),
                        Text("EMAIL:- " +
                            snapshot.data![index].email.toString()),
                        Text("ID:- " + snapshot.data![index].id.toString()),
                        Text("NAME:- " + snapshot.data![index].name.toString()),
                        Text("PHONE:- " +
                            snapshot.data![index].phone.toString()),
                        Text("USERNAME:- " +
                            snapshot.data![index].username.toString()),
                        Text("WEBSITE:- " +
                            snapshot.data![index].website.toString()),
                        Text("STREET:- " +
                            snapshot.data![index].address!.street.toString()),
                        Text("SUITE:- " +
                            snapshot.data![index].address!.suite.toString()),
                        Text("ZIPCODE:- " +
                            snapshot.data![index].address!.zipcode.toString()),
                        Text("CITY:- " +
                            snapshot.data![index].address!.city.toString()),
                        //  Text(" "+snapshot.data![index].address!.city.toString()),
                        Text("LAT:- " +
                            snapshot.data![index].address!.geo!.lat.toString()),
                        Text("LOG:- " +
                            snapshot.data![index].address!.geo!.lng.toString()),
                      ],
                    ),
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

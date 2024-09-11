import 'dart:convert';
import 'package:api_intigration_tutorial/Models/drop_down_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropdownApiScreen extends StatefulWidget {
  const DropdownApiScreen({super.key});

  @override
  State<DropdownApiScreen> createState() => _DropdownApiScreenState();
}

class _DropdownApiScreenState extends State<DropdownApiScreen> {
  List<DropDownModel> data = [];
  String? selectedValue;

  Future<List<DropDownModel>> getData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => DropDownModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropDown")),
      body: Column(
        children: [
          FutureBuilder<List<DropDownModel>>(
            future: getData(),
            builder: (context, AsyncSnapshot<List<DropDownModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text("No data available");
              } else {
                return Center(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    items: snapshot.data!.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.id.toString(),
                        child: Text(item.title.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

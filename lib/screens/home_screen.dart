import "dart:convert";

import "package:api_intigration_tutorial/Models/post_model.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  // fetchData() async {
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   var response = await http.get(url); 
  //   if (response.statusCode == 200) {
  //     print("data fetched succesfully ${response.body}");
  //   } else {
  //     print("failed to print data ");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("api class"),
      ),
      body: Column(
        children: [
          // ElevatedButton(onPressed: fetchData, child: Text("fetch data")),
          Center(child: Text("sachin")),
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("title:\n" +
                                      postList[index].title.toString()),
                                  Text("description:\n" +
                                      postList[index].body.toString())
                                ],
                              ),
                            ),
                          );
                        });
                  } 
                }),
          ),
        ],
      ),
    );
  }
}

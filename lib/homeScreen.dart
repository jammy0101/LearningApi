import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PostsModel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {


  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi ()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api1'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  }else{
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Id",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(postList[index].id.toString()),
                                  Text('Tile',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(postList[index].title.toString()),
                                  Text("Description",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(postList[index].body.toString()),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}


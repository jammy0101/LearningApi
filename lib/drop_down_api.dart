import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/DropDownModel.dart';

class DropDownApi extends StatefulWidget {
  const DropDownApi({super.key});

  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {

  Future<List<DropDawnModal>> getPost()async{
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var body = json.decode(response.body) as List;
      if(response.statusCode == 200){
        return body.map((e){
          final map = e as Map<String,dynamic>;

          return DropDawnModal(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }
    }on SocketException{
      throw Exception('No Internet');
    }
      throw Exception('Error Fetching Data');

  }
var selectedValue ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('DropDownApi'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<DropDawnModal>>(
              future: getPost(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return DropdownButton(
                    isExpanded: true,
                    hint: Text('Select value'),
                      value: selectedValue,
                      icon: Icon(Icons.accessibility_new),
                      items: snapshot.data!.map((e){
                        return DropdownMenuItem(
                          value: e.title.toString(),
                            child: Text(e.title.toString()),
                        );
                      }).toList(),
                      onChanged: (value){
                        selectedValue = value;
                      setState(() {

                      });
                      }
                  );
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              }
          ),
        ],
      ),
    );
  }
}

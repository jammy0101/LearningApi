import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Practice2 extends StatefulWidget {
  const Practice2({super.key});

  @override
  State<Practice2> createState() => _Practice2State();
}

class _Practice2State extends State<Practice2> {
  
  List<Photos> photosList = [];
  
  Future<List<Photos>> getApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(
            id: i['id'],
            title: i['title'],
            url: i['url'],
        );
        photosList.add(photos);
      }
      return photosList;
    }else{
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApiWithoutModal'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
        Expanded(
          child: FutureBuilder(
              future: getApi(),
              builder: (context,snapshot){
                return ListView.builder(
                  itemCount: photosList.length,
                    itemBuilder: (context,index){
                    return ListTile(
                      title: Text(photosList[index].id.toString()),
                      subtitle: Text(photosList[index].title.toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(photosList[index].url.toString()),
                      ),
                    );
                    
                    }
                );
              }
           ),
         )
        ],
      ),
    );
  }
}


class Photos {
  int id;
  String title,url;

  Photos({required this.id,required this.title,required this.url});
}

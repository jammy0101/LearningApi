import 'dart:convert';

import 'package:api/Models/PracticeModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  List<PracticeModel> listPractice = [];

  Future<List<PracticeModel>> getApi()async{
    
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        listPractice.add(PracticeModel.fromJson(i));
      }
      return listPractice;
    }else{
      return listPractice;
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getApi(),
                builder: (context,AsyncSnapshot<List<PracticeModel>> snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Column(
                              children: [
                                Text('ID',style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(listPractice[index].id.toString()),
                                Text('title',style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(listPractice[index].title.toString()),
                                Text('body',style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(listPractice[index].body.toString()),
                              ],
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


// class ReusableRow extends StatelessWidget {
//   int id;
//   String title,body;
//    ReusableRow({super.key ,
//      required this.id,
//      required this.title,
//      required this.body,
//    });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(title),
//       Text(body),
//      
//       ],
//     );
//   }
// }

import 'dart:convert';

import 'package:api/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userModel = [];

  Future<List<UserModel>>  getUserModel ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userModel.add(UserModel.fromJson(i));
      }
      return userModel;
    }else{
      return userModel;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api3'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserModel(),
                  builder: (context,AsyncSnapshot<List<UserModel>> snapshot){

                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return ListView.builder(
                          itemCount: userModel.length,
                          itemBuilder: (context,index){
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Column(
                                  children: [
                                    ReusableRow(title: 'Name', value: snapshot.data![index].name.toString(),),
                                    ReusableRow(title: 'username', value: snapshot.data![index].username.toString(),),
                                    ReusableRow(title: 'email', value: snapshot.data![index].email.toString(),),
                                    ReusableRow(title: 'street', value: snapshot.data![index].address!.street.toString(),),
                                    ReusableRow(title: 'suite', value: snapshot.data![index].address!.suite.toString(),),
                                    ReusableRow(title: 'city', value: snapshot.data![index].address!.city.toString(),),
                                    ReusableRow(title: 'zipcode', value: snapshot.data![index].address!.zipcode.toString(),),
                                    ReusableRow(title: 'lat', value: snapshot.data![index].address!.geo!.lat.toString(),),
                                    ReusableRow(title: 'lng', value: snapshot.data![index].address!.geo!.lng.toString(),),
                                    ReusableRow(title: 'phone', value: snapshot.data![index].phone.toString(),),
                                    ReusableRow(title: 'website', value: snapshot.data![index].website.toString(),),
                                    ReusableRow(title: 'name', value: snapshot.data![index].company!.name.toString(),),
                                    ReusableRow(title: 'catchPhrase', value: snapshot.data![index].company!.catchPhrase.toString(),),
                                    ReusableRow(title: 'bs', value: snapshot.data![index].company!.bs.toString(),),
                                  ],
                                ),
                              ),
                            );
                          }
                       );
                     }
                   }
               )
           )

        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}

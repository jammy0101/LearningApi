import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownApi extends StatefulWidget {
  const DropDownApi({super.key});

  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownApi'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

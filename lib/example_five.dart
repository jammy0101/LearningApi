// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Models/ProductsModel.dart';
//
// class ExampleFive extends StatefulWidget {
//   const ExampleFive({super.key});
//
//   @override
//   State<ExampleFive> createState() => _ExampleFiveState();
// }
//
// class _ExampleFiveState extends State<ExampleFive> {
//
//   Future<ProductsModel> getProductsApi ()async{
//     final response = await http.get(Uri.parse('https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7'));
//     var data = jsonDecode(response.body.toString());
//     if(response.statusCode == 200){
//       print(data);
//       return ProductsModel.fromJson(data);
//     }else{
//      return ProductsModel.fromJson(data);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('APi5'),
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//         child: FutureBuilder(
//       future: getProductsApi(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data?.data == null) {
//           return const Center(child: Text('No data available'));
//         } else {
//           // Now it's safe to use snapshot.data!
//           return ListView.builder(
//             itemCount: snapshot.data!.data!.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//               ListTile(
//               title: Text(snapshot.data!.data![index].shop!.name.toString()),
//                 subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
//                 leading: CircleAvatar(
//                     backgroundImage: NetworkImage(snapshot.data!.data! [index].shop!.image.toString()),
//                 ),
//               ),
//                  Container(
//                      height: MediaQuery.of(context).size.height *3,
//                      width: MediaQuery.of (context).size.width * 1,
//                    child: ListView.builder(
//                      scrollDirection: Axis.horizontal,
//                      itemCount: snapshot.data!.data![index].images!.length,
//                        itemBuilder: (context,position){
//                      return Container(
//                        height: MediaQuery.of(context).size.height *.25,
//                        width : MediaQuery.of(context).size.width *5,
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                              image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()),
//                          ),
//                        ),
//                      );
//                    }),
//                  ),
//               Icon(snapshot.data!.data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
//                 ],
//               );
//             },
//           );
//         }
//       },
//     ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
// //This api is destroyed by mistake that's why its not working


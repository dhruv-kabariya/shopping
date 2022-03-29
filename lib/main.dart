import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void  main() {
  runApp(Shopping());
}
//type stl and choose stateless widget

class Shopping extends StatelessWidget {
  const Shopping({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: "AU Shopping",
  home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);
  

  Future<Map> getData()async{
    // Future.delayed(Duration(seconds: 2));
    var data = await http.get(Uri.parse("https://fakestoreapi.com/products/1"));
    Map staticData = {
      "title":"Adidas",
      "image":"https://m.media-amazon.com/images/I/71D9ImsvEtL._UY500_.jpg",
      "price":129.2
    };
    return data.body == null ? staticData: jsonDecode(data.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      
        title: Text("AU Shopping"),
        actions: [
          Icon(Icons.search)
        ],
      ),
        body: FutureBuilder<Map>(

        future: getData(),
        builder : (context,state){
          if(state.hasData){
            return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Product(
             state.data!["title"],
             state.data!["image"],
             state.data!["price"],
             
           ),
            Product(state.data!["title"],
             state.data!["image"],
             state.data!["price"],),
             Product(
             state.data!["title"],
             state.data!["image"],
             state.data!["price"],
             
           ),
          
          ],
        );
          }else{
            return const CircularProgressIndicator();
          }

          
        }
      ),
    );
  }
}

class Product extends StatelessWidget {
  Product(this.title,this.image,this.price,{ Key? key }) : super(key: key);

  String image;
  String title;
  double price;

  @override
  Widget build(BuildContext context) {
    return  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: 375,
              width: 250,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.favorite_border,),
                          Icon(Icons.add,color: Colors.amber,),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        child: Image( image: NetworkImage(image)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(title,style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                      ),
                      
                      textAlign: TextAlign.center),
                      SizedBox(
                        height: 10,
                      ),
                      Text(price.toString(),style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),)
                    ],
                  ),
                ),
              ),
            );
  }
}
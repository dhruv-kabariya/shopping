import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Row(
        children: [
          Card(

            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.add),
                    Icon(Icons.favorite_border)
                  ],
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.pink,

                ),
                Text("Adidas"),
                Text("Air track"),
                Text("280")
              ],
            ),
          ),
          Container(
          child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.add),
                    Icon(Icons.favorite_border)
                  ],
                ),
                // image will be here
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.pink,

                ),

                Text("Adidas"),
                
                Text("Air track"),
              
                Text("280")
              ],

            ),
          )
        ],
      ),
    );
  }
}
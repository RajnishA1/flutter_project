import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {
  runApp(myapp());
  
}
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
      
      
      
    );
  }
}
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("thisi si rj"),
      ),
       body: StreamBuilder(
        stream: Firestore.instance.collection('asv').snapshots(),
        builder: (context, snapshort){
          if(!snapshort.hasData) return Text(" loading data please wait...");
          return Column(
            children: <Widget>[
              Text(snapshort.data.documents[0]['student']),
              Text(snapshort.data.documents[0]['attendence'].toString()),
              Text(snapshort.data.documents[1]['student']),
              Text(snapshort.data.documents[1]['attendence'].toString()),
              
            ],
            
          );
          

        },
      ),
    );
  }
}
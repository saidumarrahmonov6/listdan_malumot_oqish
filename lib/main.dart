import 'package:flutter/material.dart';
import 'package:list_view_1/qoshish.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  final oquvchilarList;
  const MyApp({super.key, this.oquvchilarList,});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> oquvchilar=[];
  @override
  void initState() {
    super.initState();
    if(widget.oquvchilarList != null){
      oquvchilar = widget.oquvchilarList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: oquvchilar.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 100,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: Text(
              oquvchilar[index],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddApp(oquvchilar: oquvchilar,)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

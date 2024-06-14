import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_view_1/qoshish.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  final oquvchilarList;
  final ranglar;
  final raqam;
  const MyApp({super.key, this.oquvchilarList, this.ranglar, this.raqam,});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController edited = TextEditingController();
  TextEditingController edited_number = TextEditingController();
  List<String> oquvchilar=[
    "Alisher"
  ];
  List<Color> ranglar = [
    Colors.black
  ];
  List<String> raqamlar = [
    "901231212"
  ];
  @override
  void initState() {
    super.initState();
    if(widget.oquvchilarList != null && widget.ranglar != null && widget.raqam != null){
      ranglar = widget.ranglar;
      oquvchilar = widget.oquvchilarList;
      raqamlar = widget.raqam;
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
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        if(ranglar[index] == Colors.black){
                          ranglar[index] = Colors.yellow;
                        } else if(ranglar[index] == Colors.yellow){
                          ranglar[index] = Colors.black;
                        }
                      });
                    },
                    icon: Icon(Icons.star, size: 50, color: ranglar[index],),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Text(
                        oquvchilar[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        raqamlar[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            setState(() {
                              showDialog(context: context, builder: (_)=>AlertDialog(
                                title: Text("Rostdan ham o'chirasizmi"),
                                actions: [
                                  TextButton(onPressed: (){
                                    oquvchilar.removeAt(index);
                                    raqamlar.removeAt(index);
                                    ranglar.removeAt(index);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Muvafaqiyatli o'chirildi")));
                                    Navigator.pop(context);
                                    setState(() {});
                                  }, child: Text("Ha")),
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("Yo'q"))
                                ],
                              ));
                            });
                          },
                          child: Icon(Icons.delete, size: 40,)),
                      SizedBox(width: 20,),
                      InkWell(
                          onTap: (){
                            setState(() {
                              edited = TextEditingController(text: oquvchilar[index]);
                              edited_number = TextEditingController(text: raqamlar[index]);
                              showDialog(context: context, builder: (_)=> AlertDialog(
                                title: Text("O'zgartirish"),
                                actions: [
                                  TextField(
                                    controller: edited,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextField(
                                    controller: edited_number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        if((int.parse(edited_number.text).toString().length == 9 || int.parse(edited_number.text).toString().length == 9) &&edited.text.length >= 3 && edited_number.text.length == 9 || edited_number.text.length == 13){
                                        oquvchilar[index] = edited.text;
                                        raqamlar[index] = edited_number.text;
                                        Navigator.pop(context);
                                        edited.clear();
                                        edited_number.clear();}
                                      });
                                    },
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        width: 300,
                                        height: 60,
                                        alignment: Alignment.center,
                                        child: Text("Saqlash", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                                      ),
                                    ),
                                  )
                                ],
                              ));
                            });
                          },
                          child: Icon(Icons.edit, size: 40,)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddApp(oquvchilar: oquvchilar, ranglar: ranglar,raqamlar: raqamlar,)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

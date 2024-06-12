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
  const MyApp({super.key, this.oquvchilarList, this.ranglar,});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController edited = TextEditingController();
  List<String> oquvchilar=[
    "Alisher","Abror", "Nurmuhammad"
  ];
  List<Color> ranglar = [
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  @override
  void initState() {
    super.initState();
    if(widget.oquvchilarList != null && widget.ranglar != null){
      ranglar = widget.ranglar;
      oquvchilar = widget.oquvchilarList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: oquvchilar.length,
        itemBuilder: (BuildContext context, int index) {
          return Block(oquvchilar[index].length, index,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddApp(oquvchilar: oquvchilar, ranglar: ranglar,)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Block(uzunligi, index ){
    if(uzunligi < 8){
      return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 100,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(width: 20,),
            IconButton(
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
            InkWell(
                onTap: (){
                  setState(() {
                    showDialog(context: context, builder: (_)=>AlertDialog(
                      title: Text("Rostdan ham o'chirasizmi"),
                      actions: [
                        TextButton(onPressed: (){
                          oquvchilar.removeAt(index);
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
            SizedBox(width: 10,),
            InkWell(
                onTap: (){
                  setState(() {
                    edited = TextEditingController(text: oquvchilar[index]);
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
                        InkWell(
                          onTap: (){
                            setState(() {
                              oquvchilar[index] = edited.text;
                              Navigator.pop(context);
                              edited.clear();
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
            SizedBox(width: 20,)
          ],
        ),
      );
    } else{
      return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 100,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: Column(
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
            Row(
              children: [
                IconButton(
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: (){
                            setState(() {
                              showDialog(context: context, builder: (_)=>AlertDialog(
                                title: Text("Rostdan ham o'chirasizmi"),
                                actions: [
                                  TextButton(onPressed: (){
                                    oquvchilar.removeAt(index);
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
                      SizedBox(width: 10,),
                      InkWell(
                          onTap: (){
                            setState(() {
                              edited = TextEditingController(text: oquvchilar[index]);
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
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        oquvchilar[index] = edited.text;
                                        Navigator.pop(context);
                                        edited.clear();
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
                      SizedBox(width: 20,)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}

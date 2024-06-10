import 'package:flutter/material.dart';
import 'package:list_view_1/main.dart';

class AddApp extends StatefulWidget {
  final oquvchilar;
  final ranglar;
  const AddApp({super.key, required this.oquvchilar,required this.ranglar});

  @override
  State<AddApp> createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  TextEditingController ismtxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: ismtxt,
                decoration: InputDecoration(
                  hintText: "Ism kiriting",
                  border: InputBorder.none
                ),
              )
          ),
          InkWell(
            onTap: (){
              List<String> oquv = widget.oquvchilar;
              oquv.add(ismtxt.text);
              List<Color> rang = widget.ranglar;
              rang.add(Colors.black);
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyApp(oquvchilarList: oquv, ranglar: rang,)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("Qo'shish"),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:list_view_1/main.dart';

class AddApp extends StatefulWidget {
  final oquvchilar;
  final ranglar;
  final raqamlar;
  const AddApp({super.key, required this.oquvchilar,required this.ranglar, this.raqamlar});

  @override
  State<AddApp> createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  TextEditingController ismtxt = TextEditingController();
  TextEditingController raqamtxt = TextEditingController();
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
              ),
          ),
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
              controller: raqamtxt,
              decoration: InputDecoration(
                  hintText: "Raqam kiriting",
                  border: InputBorder.none
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print(raqamtxt);
              print(ismtxt);
              if(ismtxt.text.length >= 3 && raqamtxt.text.length == 9 || raqamtxt.text.length == 13){
                print("Hammasi tog'ri");
                List<String> oquv = widget.oquvchilar;
                oquv.add(katta(ismtxt.text));
                List<Color> rang = widget.ranglar;
                rang.add(Colors.black);
                List<String> raqamlar = widget.raqamlar;
                raqamlar.add(raqamtxt.text.toString());
                print(raqamlar);
                Navigator.push(context, MaterialPageRoute(builder: (_)=>MyApp(oquvchilarList: oquv, ranglar: rang, raqam: raqamlar,)));
              }
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
  katta(ism){
    String bosh = ism.toString().substring(0, 1).toUpperCase();
    String davomi = ism.toString().substring(1 , ism.toString().length);
    return bosh + davomi;
  }
}

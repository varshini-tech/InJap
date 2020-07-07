import 'package:flutter/material.dart';

//import 'dart:io';
void main() {
  runApp(FirstApp());
}

class FirstApp extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<FirstApp> {
  //gets the input name
  String result = "";

  List<String> japanese = [
    "ka", "tu", "mi", "te", "ku", "lu", "ji", //japanese values for alphabets
    "ri", "ki", "zu", "me", "ta", "rin", "to", "mo", "no",
    "ke", "shi", "ari", "chi", "do", "ru", "mei", "na", "fu", "zi"
  ];

  String translationResult = ""; //output of the translation

  String finalTranslatedString = ""; //text to be shown as result

  final TextEditingController controller =
      new TextEditingController(); //controller to empty textfieldcmd


  String translat({String s}) {
    //function for matching japnese alphabets
    translationResult = "";
    for (int i = 0; i < s.length; i++) {
      if (s[i].toUpperCase() == s[i]) {
        // print("Its an upperCase ${s[i]}");
        int trans_val = s.codeUnitAt(i) - 65;
        //print(japanese[trans_val]);
        translationResult = translationResult + japanese[trans_val];
      } else {
        //print("Its a LowerCase");
        int val_trans = s.codeUnitAt(i) - 97;
        // print(japanese[val_trans]);
        translationResult = translationResult + japanese[val_trans];
      }
    }
    print(translationResult);

    return translationResult; //translat functions returns the japnese string
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
            primaryColor: Colors.amber[300], accentColor: Colors.black26),
        home: Scaffold(
          appBar: AppBar(title: Text("InJap")),
          body: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter a name'),
                onSubmitted: (String value) {
                  setState(() => {
                        result = value,
                        // print(result.codeUnits),
                        finalTranslatedString = translat(
                          s: result
                        ), //translat function is called with input passed by user
                        // print(japanese[0]),
                      });
                  controller.text = "";
                },
                controller: controller,
              ),
              Text(
                result,
                style: new TextStyle(
                  fontSize: 45,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..color = Colors.blueGrey[700]
                    ..strokeWidth = 4,
                ),
              ),
              Text(
                finalTranslatedString,
                style: new TextStyle(
                  fontSize: 45,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..color = Colors.blue[700]
                    ..strokeWidth = 4,
                ),
              ),
            ],
          ),
        ));
  }
}

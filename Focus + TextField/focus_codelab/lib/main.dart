import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter FocusNode for TextField",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //1 -> 4

  //01
  FocusNode myFocusNode;

  //02
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  //03
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FocusNode with TextField [codelab-flutter.dev]"),
        ),
        body: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "This is Focus by FocusNode() instance"),
            ),
            TextField(
              //04
              focusNode: myFocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "This is 'autofocus'",
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.center_focus_strong),
          onPressed: () {
            myFocusNode.requestFocus();
          },
        ));
  }
}



/*
Like below ,we dont need to create seperate Stateful widget to keep FocusNode()
instance.
Because TextField() is related to a specific screen, and that TextFields only 
dispose when that screen get disposed. So FocusNode related to that TextFields 
will dispose with TextField disposement.(TExtField are dispose when screen dispose
so we can keep that FocusNode instance in above screen Stateful widget)
-----


class FocusTextField extends StatefulWidget {
  @override
  _FocusTextFieldState createState() => _FocusTextFieldState();
}

class _FocusTextFieldState extends State<FocusTextField> {
  //01
  FocusNode myFocusNode;

  //02
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  //03
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: myFocusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "This is 'autofocus'",
      ),
    );
  }
}
*/

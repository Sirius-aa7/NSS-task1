import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSS Task1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NSS TASK 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  static String result ='0';

  String getResult(){
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // first input field
            Padding(padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter 1st number',
                  hintText:  'Enter 1st number',
                ),
                controller: num1,
              ),
            ),
            //second input filed
            Padding(padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter 2nd number',
                  hintText:  'Enter 2nd number',
                ),
                controller: num2,
              ),
            ),

            RaisedButton(
              color: Colors.yellow,
              child: Text('ADD'),
              onPressed: (){
                setState((){
                  int sum = int.parse(num1.text) + int.parse(num2.text);
                  result = sum.toString();
                });
                Navigator.push( context, MaterialPageRoute(builder: (context) => SecondRoute()),);
                // Navigate to second route when tapped
              },
            ),

            RaisedButton(
              color: Colors.yellow,
              child: Text('SUBTRACT'),
              onPressed: (){
                setState((){
                  int sum = int.parse(num1.text) - int.parse(num2.text);
                  result = sum.toString();
                });
                Navigator.push( context, MaterialPageRoute(builder: (context) => SecondRoute()),);
              },
            ),

            RaisedButton(
              color: Colors.yellow,
              child: Text('MULTIPLY'),
              onPressed: (){
                setState((){
                  int sum = int.parse(num1.text) * int.parse(num2.text);
                  result = sum.toString();
                });
                Navigator.push( context, MaterialPageRoute(builder: (context) => SecondRoute()),);
              },
            ),

          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget  {
  SecondRoute({key}) : super(key: key);

  _MyHomePageState myHomePageState= new _MyHomePageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Column(
        children:[
          SizedBox(height: 15),
          new Text( myHomePageState.getResult(),//result
             style: TextStyle(
               color: Colors.red,
               fontWeight: FontWeight.bold,
               fontSize: 25,
             ),), // for giving my results out

          RaisedButton(
            color: Colors.yellow,
            child: Text('GO BACK!'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

        ]
      ),
    );
  }
}

// Arnav Gujarathi 2020A7PS0066P
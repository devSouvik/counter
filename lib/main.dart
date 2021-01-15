import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DynamicWidget> ListDynamic = [];

  addDynamic() {
    ListDynamic.add(new DynamicWidget());
    print(" add button pressed ");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(icon: Icon(Icons.add), onPressed: addDynamic),
              ),
            ],
            title: Center(
              child: Text(
                'Multi Counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          //body will be here
          body: new Container(
            child: Column(
              children: [
                new Flexible(
                  child: new ListView.builder(
                      itemCount: ListDynamic.length,
                      itemBuilder: (_, index) => ListDynamic[index]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicWidget extends StatefulWidget {
  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  
                  Text(
                    'Your Text here : ',
                  ),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_rounded),
                        onPressed: decrementCounter,
                        iconSize: 40,
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_rounded),
                        onPressed: incrementCounter,
                        iconSize: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

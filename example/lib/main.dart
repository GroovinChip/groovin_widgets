import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GroovinWidgets"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ModalDrawerHandle(
                            handleColor: Colors.indigoAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlineDropdownButton(
              items: [
                DropdownMenuItem(
                  child: Text("Test Item"),
                  value: "Test Item",
                ),
              ],
              isExpanded: true,
              hint: Text("Test Hint"),
              value: value,
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
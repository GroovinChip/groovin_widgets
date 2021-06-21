import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroovinWidgets demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      home: GroovinWidgetsDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroovinWidgetsDemo extends StatefulWidget {
  @override
  _GroovinWidgetsDemoState createState() => _GroovinWidgetsDemoState();
}

class _GroovinWidgetsDemoState extends State<GroovinWidgetsDemo> {
  var value;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 700) {
          // tablet
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AvatarBackButton(
                    backButton: AdaptiveBackIcon(),
                    avatar:
                        'https://avatars.githubusercontent.com/u/4250470?s=460&u=ba3546d38c6f3dcc65d7451e3f6d7893ca4dfde8&v=4',
                    onPressed: () => print('tap'),
                  ),
                  SizedBox(width: 8),
                  Text('GroovinWidgets'),
                ],
              ),
            ),
            body: ScrollControllerBuilder(
              builder: (_, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: OutlineDropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text('Test Item'),
                              value: 'Test Item',
                            ),
                          ],
                          isExpanded: true,
                          hint: Text('Test Hint'),
                          value: value,
                          onChanged: (value) => print(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GroovinExpansionTile(
                          defaultTrailingIconColor: Colors.indigoAccent,
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigoAccent,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Test Person'),
                          subtitle: Text('123-456-7890'),
                          onExpansionChanged: (value) {
                            setState(() => isExpanded = value);
                          },
                          inkwellRadius: !isExpanded
                              ? BorderRadius.all(Radius.circular(8.0))
                              : BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                ),
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.notifications),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.comment),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.phone),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              color: Colors.indigo,
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  'Luminance',
                                  style: TextStyle(
                                    color: textLuminance(Colors.indigo),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  'Luminance',
                                  style: TextStyle(
                                    color: textLuminance(Colors.grey.shade300),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.drag_handle),
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                builder: (builder) {
                  return Container(
                    height: 250.0,
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
              ),
            ),
          );
        } else {
          // mobile
          return SplitColorBackground(
            headerColor: Colors.indigo,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AvatarBackButton(
                    backButton: AdaptiveBackIcon(),
                    avatar:
                        'https://avatars.githubusercontent.com/u/4250470?s=460&u=ba3546d38c6f3dcc65d7451e3f6d7893ca4dfde8&v=4',
                    onPressed: () => print('tap'),
                  ),
                  SizedBox(width: 8),
                  Text('GroovinWidgets'),
                ],
              ),
            ),
            header: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SplitColorBackground Header',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OutlineDropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text('Test Item'),
                          value: 'Test Item',
                        ),
                      ],
                      isExpanded: true,
                      hint: Text('Test Hint'),
                      value: value,
                      onChanged: (value) => print(value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: GroovinExpansionTile(
                      defaultTrailingIconColor: Colors.indigoAccent,
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Test Person',
                      ),
                      subtitle: Text('123-456-7890'),
                      onExpansionChanged: (value) {
                        setState(() => isExpanded = value);
                      },
                      inkwellRadius: !isExpanded
                          ? BorderRadius.all(Radius.circular(8.0))
                          : BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                            ),
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.notifications),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.comment),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.phone),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          color: Colors.indigo,
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Luminance',
                              style: TextStyle(
                                color: textLuminance(Colors.indigo),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey.shade300,
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Luminance',
                              style: TextStyle(
                                color: textLuminance(Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bodyFlex: 4,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.drag_handle),
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                builder: (builder) {
                  return Container(
                    height: 250.0,
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
              ),
            ),
          );
        }
      },
    );
  }
}

class AdaptiveBackIcon extends StatelessWidget {
  const AdaptiveBackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Icon(Icons.arrow_back);
    }

    if (Platform.isIOS || Platform.isMacOS) {
      return Icon(CupertinoIcons.back);
    } else {
      return Icon(Icons.arrow_back);
    }
  }
}

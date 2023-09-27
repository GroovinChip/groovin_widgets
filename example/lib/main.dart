import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroovinWidgets demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          secondary: Colors.indigoAccent,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: ThemeData.dark().canvasColor,
          onSurface: const ColorScheme.dark().onSurface,
          brightness: Brightness.dark,
          secondary: Colors.indigoAccent,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const GroovinWidgetsDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroovinWidgetsDemo extends StatefulWidget {
  const GroovinWidgetsDemo({super.key});

  @override
  State<GroovinWidgetsDemo> createState() => _GroovinWidgetsDemoState();
}

class _GroovinWidgetsDemoState extends State<GroovinWidgetsDemo> {
  String? value;
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
                    backButton: const AdaptiveBackIcon(),
                    avatar:
                        'https://avatars.githubusercontent.com/u/4250470?s=460&u=ba3546d38c6f3dcc65d7451e3f6d7893ca4dfde8&v=4',
                    onPressed: () => debugPrint('tap'),
                  ),
                  const SizedBox(width: 8),
                  const Text('GroovinWidgets'),
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
                          items: const [
                            DropdownMenuItem(
                              value: 'Test Item',
                              child: Text('Test Item'),
                            ),
                          ],
                          isExpanded: true,
                          hint: const Text('Test Hint'),
                          value: value,
                          onChanged: (value) => debugPrint(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GroovinExpansionTile(
                          defaultTrailingIconColor: Colors.indigoAccent,
                          leading: const CircleAvatar(
                            backgroundColor: Colors.indigoAccent,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Test Person'),
                          subtitle: const Text('123-456-7890'),
                          onExpansionChanged: (value) {
                            setState(() => isExpanded = value);
                          },
                          inkwellRadius: !isExpanded
                              ? const BorderRadius.all(Radius.circular(8.0))
                              : const BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                ),
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
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
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.notifications),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.comment),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.phone),
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
              child: const Icon(Icons.drag_handle),
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                builder: (builder) {
                  return const SizedBox(
                    height: 250.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
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
                    backButton: const AdaptiveBackIcon(),
                    avatar:
                        'https://avatars.githubusercontent.com/u/4250470?s=460&u=ba3546d38c6f3dcc65d7451e3f6d7893ca4dfde8&v=4',
                    onPressed: () => debugPrint('tap'),
                  ),
                  const SizedBox(width: 8),
                  const Text('GroovinWidgets'),
                ],
              ),
            ),
            header: const SafeArea(
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
                    child: OutlineDropdownButton<String?>(
                      items: const [
                        DropdownMenuItem(
                          value: 'Test Item',
                          child: Text('Test Item'),
                        ),
                      ],
                      isExpanded: true,
                      hint: const Text('Test Hint'),
                      value: value,
                      onChanged: (value) => debugPrint(value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: GroovinExpansionTile(
                      defaultTrailingIconColor: Colors.indigoAccent,
                      leading: const CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: const Text(
                        'Test Person',
                      ),
                      subtitle: const Text('123-456-7890'),
                      onExpansionChanged: (value) {
                        setState(() => isExpanded = value);
                      },
                      inkwellRadius: !isExpanded
                          ? const BorderRadius.all(Radius.circular(8.0))
                          : const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                            ),
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
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
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.notifications),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.comment),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.phone),
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
              child: const Icon(Icons.drag_handle),
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                builder: (builder) {
                  return const SizedBox(
                    height: 250.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
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
  const AdaptiveBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Icon(Icons.arrow_back);
    }

    if (Platform.isIOS || Platform.isMacOS) {
      return const Icon(CupertinoIcons.back);
    } else {
      return const Icon(Icons.arrow_back);
    }
  }
}

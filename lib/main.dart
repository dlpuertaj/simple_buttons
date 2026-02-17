import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int buttons = 4;

    return MaterialApp(
      title: 'New App Ussing Flutter',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.dark,

      home: MyHomeScreen(buttons), //const Text('The New App'),MyHomeScreen(),//
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen(this.buttons, {super.key});

  final int buttons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The App Bar'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        verticalDirection: VerticalDirection.down,
        children: [
          DynamicButtonBuilder(buttons: buttons),
          Container(color: Colors.deepPurple, child: Text('')),
        ],
      ),
    );
  }
}

class DynamicButtonBuilder extends StatelessWidget {
  const DynamicButtonBuilder({super.key, required this.buttons});

  final int buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < buttons; i++)
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(2),
              color: Colors.red,
              child: Text('Button ${i + 1}', textAlign: TextAlign.center),
            ),
          ),
      ],
    );
  }
}

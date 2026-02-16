import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: MyHomeScreen(), //const Text('The New App'),MyHomeScreen(),//
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The App Bar'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))],
      ),
    );
  }
}

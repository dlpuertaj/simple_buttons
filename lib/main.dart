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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  static const int _maxButtonsPerRow = 3;
  static const int _maxTotalButtons = 6;

  int _numberOfButtons = 1;

  void _addButton() {
    if (_numberOfButtons >= _maxTotalButtons) return;

    setState(() {
      _numberOfButtons++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rows = _buildRows();

    return Scaffold(
      appBar: AppBar(
        title: Text('The App Bar'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: _numberOfButtons >= _maxTotalButtons ? null : _addButton,
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            const Spacer(), // pushes everything below it down

            for (final row in rows)
              Row(
                children: [
                  for (final index in row)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Button ${index + 1}'),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  List<List<int>> _buildRows() {
    final rows = <List<int>>[];

    for (int i = 0; i < _numberOfButtons; i += _maxButtonsPerRow) {
      final end = (i + _maxButtonsPerRow < _numberOfButtons)
          ? i + _maxButtonsPerRow
          : _numberOfButtons;

      rows.add(List.generate(end - i, (index) => i + index));
    }

    return rows;
  }
}

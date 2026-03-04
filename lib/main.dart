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

      home: const MyHomeScreen(
        maxButtonsPerRow: 3,
        maxTotalButtons: 6,
        initialButtons: 1, //const Text('The New App'),MyHomeScreen(),//
      ),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  final int maxButtonsPerRow;
  final int maxTotalButtons;
  final int initialButtons;

  const MyHomeScreen({
    super.key,
    this.maxButtonsPerRow = 3,
    this.maxTotalButtons = 6,
    this.initialButtons = 1,
  }) : assert(initialButtons >= 0 && initialButtons <= maxTotalButtons);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  late int _numberOfButtons;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberOfButtons = widget.initialButtons;
  }

  void _addButton() {
    if (_numberOfButtons >= widget.maxTotalButtons) return;

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
            onPressed: _showPopupForm,
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (final row in rows)
              Row(
                children: [
                  for (final index in row)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          key: ValueKey(index),
                          onPressed: () {
                            debugPrint('Button ${index + 1} pressed');
                          },
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

    for (int i = 0; i < _numberOfButtons; i += widget.maxButtonsPerRow) {
      final end = (i + widget.maxButtonsPerRow < _numberOfButtons)
          ? i + widget.maxButtonsPerRow
          : _numberOfButtons;

      rows.add(List.generate(end - i, (index) => i + index));
    }

    return rows;
  }

  void _showPopupForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Simple Form'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle the apply action here, e.g., print the text or process it
                  _addButton();
                  print('Applied text: ${_textController.text}');
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        );
      },
    );
  }
}

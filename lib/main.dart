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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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
  const MyHomeScreen(this.numberOfButtons, {super.key});

  final int numberOfButtons;

  static const int _maxButtonsPerRow = 3;

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
        children: [
          const Spacer(), // pushes everything below it down

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _maxButtonsPerRow,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: numberOfButtons,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {},
                child: Text('Button ${index + 1}'),
              );
            },
          ),
        ],
      ),

      /*
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        verticalDirection: VerticalDirection.down,

        children: [
          for (int i = 0; i < numberOfButtonRows; i++)
            ButtonRow(
              currentButtonRow: i,
              numberOfButtons: numberOfButtons,
              maxButtonsPerRow: maxButtonsPerRow,
            ),

          const SizedBox(height: 20),
        ],
      ),*/
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    super.key,
    required this.currentButtonRow,
    required this.numberOfButtons,
    required this.maxButtonsPerRow,
  });

  final int currentButtonRow;
  final int numberOfButtons;
  final int maxButtonsPerRow;

  @override
  Widget build(BuildContext context) {
    int buttonsToDraw = (currentButtonRow > 0
        ? numberOfButtons - maxButtonsPerRow
        : maxButtonsPerRow);
    return Row(
      children: [
        for (int j = 0; j < buttonsToDraw; j++)
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(2),
              color: Colors.red,
              child: Text('Button ${j + 1}', textAlign: TextAlign.center),
            ),
          ),
      ],
    );
  }
}

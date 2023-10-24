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
      title: 'Catatan Pagi',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 45, 115, 219)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Catatan Pagi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  List<String> notesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: noteController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      titleController.clear();
                      noteController.clear();
                    },
                    child: Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String title = titleController.text;
                      String note = noteController.text;
                      String fullNote = 'Judul: $title, Catatan: $note';
                      setState(() {
                        notesList.add(fullNote);
                      });
                      titleController.clear();
                      noteController.clear();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: notesList
                  .map((note) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(note),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

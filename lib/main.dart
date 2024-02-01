import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ResumeItem {
  String title;
  String content;

  ResumeItem({required this.title, required this.content});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume Builder',
      home: ResumeBuilder(),
    );
  }
}

class ResumeBuilder extends StatefulWidget {
  @override
  _ResumeBuilderState createState() => _ResumeBuilderState();
}

class _ResumeBuilderState extends State<ResumeBuilder> {
  List<ResumeItem> resumeItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: resumeItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(resumeItems[index].title),
                  subtitle: Text(resumeItems[index].content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        resumeItems.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    _editItem(context, index);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _addItem(context);
              },
              child: const Text('Add Resume Item'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _viewResume(context);
              },
              child: const Text('View Resume'),
            ),
          ),
        ],
      ),
    );
  }

  void _addItem(BuildContext context) async {
    String title = "";
    String content = "";

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Resume Item'),
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resumeItems.add(ResumeItem(title: title, content: content));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(BuildContext context, int index) async {
    String title = resumeItems[index].title;
    String content = resumeItems[index].content;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Resume Item'),
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: TextEditingController(text: title),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Content'),
                controller: TextEditingController(text: content),
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resumeItems[index].title = title;
                  resumeItems[index].content = content;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _viewResume(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResumeView(resumeItems: resumeItems),
      ),
    );
  }
}

class ResumeView extends StatelessWidget {
  final List<ResumeItem> resumeItems;

  ResumeView({required this.resumeItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Preview'),
      ),
      body: ListView.builder(
        itemCount: resumeItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(resumeItems[index].title),
            subtitle: Text(resumeItems[index].content),
          );
        },
      ),
    );
  }
}

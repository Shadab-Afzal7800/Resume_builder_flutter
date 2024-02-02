import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeItem {
  String name;
  String email;
  String summary;
  String education;
  String skills;
  String languages;
  String projects;
  String certifications;
  String links;

  ResumeItem({
    required this.name,
    required this.email,
    required this.summary,
    required this.education,
    required this.skills,
    required this.languages,
    required this.projects,
    required this.certifications,
    required this.links,
  });
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Resume Builder',
      home: ResumeBuilder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResumeBuilder extends StatefulWidget {
  const ResumeBuilder({super.key});

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
                  title: Text(resumeItems[index].name),
                  subtitle: Text(resumeItems[index].email),
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
    String name = "";
    String email = "";
    String summary = "";
    String education = "";
    String skills = "";
    String languages = "";
    String certifications = "";
    String links = "";
    String projects = "";

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Resume Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Professional Summary'),
                  onChanged: (value) {
                    summary = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Skills'),
                  onChanged: (value) {
                    skills = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Education'),
                  onChanged: (value) {
                    education = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Languages'),
                  onChanged: (value) {
                    languages = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Projects'),
                  onChanged: (value) {
                    projects = value;
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Certifications'),
                  onChanged: (value) {
                    certifications = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Links'),
                  onChanged: (value) {
                    links = value;
                  },
                ),
              ],
            ),
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
                  resumeItems.add(ResumeItem(
                      name: name,
                      email: email,
                      summary: summary,
                      education: education,
                      skills: skills,
                      languages: languages,
                      projects: projects,
                      certifications: certifications,
                      links: links));
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
    String name = resumeItems[index].name;
    String email = resumeItems[index].email;
    String summary = resumeItems[index].summary;
    String education = resumeItems[index].education;
    String skills = resumeItems[index].skills;
    String languages = resumeItems[index].languages;
    String projects = resumeItems[index].projects;
    String certifications = resumeItems[index].certifications;
    String links = resumeItems[index].links;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Resume Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  controller: TextEditingController(text: name),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: TextEditingController(text: email),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Professional Summary'),
                  controller: TextEditingController(text: summary),
                  onChanged: (value) {
                    summary = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Skills'),
                  controller: TextEditingController(text: skills),
                  onChanged: (value) {
                    skills = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Education'),
                  controller: TextEditingController(text: education),
                  onChanged: (value) {
                    education = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Languages'),
                  controller: TextEditingController(text: languages),
                  onChanged: (value) {
                    languages = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Projects'),
                  controller: TextEditingController(text: projects),
                  onChanged: (value) {
                    projects = value;
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Certifications'),
                  controller: TextEditingController(text: certifications),
                  onChanged: (value) {
                    certifications = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Links'),
                  controller: TextEditingController(text: links),
                  onChanged: (value) {
                    links = value;
                  },
                ),
              ],
            ),
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
                  resumeItems[index].name = name;
                  resumeItems[index].email = email;
                  resumeItems[index].summary = summary;
                  resumeItems[index].skills = skills;
                  resumeItems[index].education = education;
                  resumeItems[index].languages = languages;
                  resumeItems[index].projects = projects;
                  resumeItems[index].certifications = certifications;
                  resumeItems[index].links = links;
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

  const ResumeView({Key? key, required this.resumeItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Preview'),
      ),
      body: ListView.builder(
        itemCount: resumeItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${resumeItems[index].name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Email: ${resumeItems[index].email}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Professional Summary: ${resumeItems[index].summary}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Skills: ${resumeItems[index].skills}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Education: ${resumeItems[index].education}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Languages: ${resumeItems[index].languages}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Projects: ${resumeItems[index].projects}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Certifications: ${resumeItems[index].certifications}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Links: ${resumeItems[index].links}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

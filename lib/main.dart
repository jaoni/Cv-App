import 'package:flutter/material.dart';

import 'editscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  String name = 'Joshua Oni';

  String email = 'oniaduragbemijoshua@gmail.com';

  String about = 'A mobile developer expertise in flutter & dart with a passion for technology and innovation.';

  String skills = 'Flutter, Dart, Firebase, Riverpod Git & Github';

  String education = 'Bachelor of Science in Industrial Chemistry';

  String experience = 'Mobile Developer Intern at Hotels.ng.'
  ;

  String hobbies = 'Learning new things ';   

  void updateData(Map<String, String> newData) {
    setState(() {
      name = newData['name'] ?? name;
      email = newData['email'] ?? email;
      about = newData['about'] ?? about;
      skills = newData['skills'] ?? skills;
      education = newData['education'] ?? education;
      experience = newData['experience'] ?? experience;
      hobbies = newData['hobbies'] ?? hobbies;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
      ),
      body: _buildCVDetails(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditScreen(
              currentName: name,
              currentEmail: email,
              currentAbout: about,
              currentSkills: skills,
              currentEducation: education,
              currentExperience: experience,
              currentHobbies: hobbies,
              updateCallback: updateData,
            )),
          ).then((result) {
            if (result != null) {
              updateData(result);
            }
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildCVDetails(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSectionTitle('Personal Information'),
          _buildInfoItem('Name', name),
          _buildInfoItem('Email', email),

          _buildSectionTitle('About Me'),
          _buildInfoItem('About', about),

          _buildSectionTitle('Skills'),
          _buildInfoItem('Skills', skills),

          _buildSectionTitle('Education'),
          _buildInfoItem('Education', education),

          _buildSectionTitle('Experience'),
          _buildInfoItem('Experience', experience),

          _buildSectionTitle('Hobbies'),
          _buildInfoItem('Hobbies', hobbies),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(value),
        ],
      ),
    );
  }
}
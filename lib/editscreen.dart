import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentAbout;
  final String currentSkills;
  final String currentEducation;
  final String currentExperience;
  final String currentHobbies;
  final Function updateCallback;

  const EditScreen({super.key, 
    required this.currentName,
    required this.currentEmail,
    required this.currentAbout,
    required this.currentSkills,
    required this.currentEducation,
    required this.currentExperience,
    required this.currentHobbies,
    required this.updateCallback,
  });

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController aboutController;
  late TextEditingController skillsController;
  late TextEditingController educationController;
  late TextEditingController experienceController;
  late TextEditingController hobbiesController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    emailController = TextEditingController(text: widget.currentEmail);
    aboutController = TextEditingController(text: widget.currentAbout);
    skillsController = TextEditingController(text: widget.currentSkills);
    educationController = TextEditingController(text: widget.currentEducation);
    experienceController = TextEditingController(text: widget.currentExperience);
    hobbiesController = TextEditingController(text: widget.currentHobbies);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    aboutController.dispose();
    skillsController.dispose();
    educationController.dispose();
    experienceController.dispose();
    hobbiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTextField('Name', nameController),
            _buildTextField('Email', emailController),
            _buildTextField('About', aboutController),
            _buildTextField('Skills', skillsController),
            _buildTextField('Education', educationController),
            _buildTextField('Experience', experienceController),
            _buildTextField('Hobbies', hobbiesController),
            ElevatedButton(
              onPressed: () {
                String updatedName = nameController.text;
                String updatedEmail = emailController.text;
                String updatedAbout = aboutController.text;
                String updatedSkills = skillsController.text;
                String updatedEducation = educationController.text;
                String updatedExperience = experienceController.text;
                String updatedHobbies = hobbiesController.text;

                widget.updateCallback({
                  'name': updatedName,
                  'email': updatedEmail,
                  'about': updatedAbout,
                  'skills': updatedSkills,
                  'education': updatedEducation,
                  'experience': updatedExperience,
                  'hobbies': updatedHobbies,
                });

                Navigator.pop(context); // Close the EditScreen
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: label == 'About' ? 3 : 1,
          ),
        ],
      ),
    );
  }
}
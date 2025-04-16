import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StylishCourseForm(),
  ));
}

class StylishCourseForm extends StatefulWidget {
  @override
  _StylishCourseFormState createState() => _StylishCourseFormState();
}

class _StylishCourseFormState extends State<StylishCourseForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final TextEditingController fetchedDataController = TextEditingController();

  String? selectedCourse;
  String? selectedSemester;
  String? selectedCreditHour;

  final List<String> courses = ['Psychology', 'Computer Science', 'IT', 'English'];
  final List<String> semesters = List.generate(8, (index) => '${index + 1}');
  final List<String> creditHours = List.generate(5, (index) => '${index + 1}');

  @override
  void initState() {
    super.initState();
    idController.addListener(() {
      if (idController.text.isNotEmpty) {
        fetchCourses(); // Automatically fetch data on ID input
      }
    });
  }

  @override
  void dispose() {
    idController.dispose();
    marksController.dispose();
    fetchedDataController.dispose();
    super.dispose();
  }

  Future<void> fetchCourses() async {
    final id = idController.text;
    if (id.isEmpty) return;

    final url = Uri.parse('https://bgnuerp.online/api/get_courses?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      fetchedDataController.text = jsonEncode(result);
    } else {
      fetchedDataController.text = 'Failed to fetch data.';
    }
  }

  Future<void> submitData() async {
    final id = idController.text;
    final marks = marksController.text;

    if (id.isEmpty || selectedCourse == null || selectedSemester == null || selectedCreditHour == null || marks.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    final url = Uri.parse('https://bgnuerp.online/api/get_courses'); // replace with your post endpoint if different
    final response = await http.post(url, body: {
      'id': id,
      'course_name': selectedCourse,
      'semester_no': selectedSemester,
      'credit_hours': selectedCreditHour,
      'marks': marks,
    });

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      fetchedDataController.text = jsonEncode(result);
    } else {
      fetchedDataController.text = 'Failed to add data.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Course Form', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              inputField(label: 'ID', controller: idController, icon: Icons.person),
              dropdownField('Course Name', courses, selectedCourse, (val) => setState(() => selectedCourse = val)),
              dropdownField('Semester No', semesters, selectedSemester, (val) => setState(() => selectedSemester = val)),
              dropdownField('Credit Hours', creditHours, selectedCreditHour, (val) => setState(() => selectedCreditHour = val)),
              inputField(label: 'Marks', controller: marksController, icon: Icons.score),
              const SizedBox(height: 10),
              button('Submit Data', submitData, Colors.green),
              const SizedBox(height: 20),
              TextField(
                controller: fetchedDataController,
                maxLines: 6,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Fetched Data',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField({required String label, required TextEditingController controller, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.deepPurple),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget dropdownField(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget button(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

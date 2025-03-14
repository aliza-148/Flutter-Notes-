import 'package:flutter/material.dart';
import 'enter.dart';

class EnterShowScreen extends StatefulWidget {
  String email;
  String phone;
  String status;

  EnterShowScreen({required this.email, required this.phone, required this.status});

  @override
  _EnterShowScreenState createState() => _EnterShowScreenState();
}

class _EnterShowScreenState extends State<EnterShowScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late String status;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
    status = widget.status;
  }

  void updateData() {
    setState(() {
      widget.email = emailController.text;
      widget.phone = phoneController.text;
      widget.status = status;
    });
  }

  void deleteData() {
    setState(() {
      widget.email = "";
      widget.phone = "";
      widget.status = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submitted Data")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Cellphone"),
            ),
            DropdownButton<String>(
              value: status,
              onChanged: (String? newValue) {
                setState(() {
                  status = newValue!;
                });
              },
              items: ["Active", "Inactive"]
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: updateData,
                  child: Text("Edit"),
                ),
                ElevatedButton(
                  onPressed: deleteData,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text("Delete"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}

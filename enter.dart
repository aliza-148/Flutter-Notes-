import 'package:flutter/material.dart';
import 'entershow.dart';

class EnterScreen extends StatefulWidget {
  @override
  _EnterScreenState createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String status = "Active"; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Cellphone"),
              keyboardType: TextInputType.phone,
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterShowScreen(
                      email: emailController.text,
                      phone: phoneController.text,
                      status: status,
                    ),
                  ),
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

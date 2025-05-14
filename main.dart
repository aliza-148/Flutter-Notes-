import 'package:flutter/material.dart';
import 'button.dart';
import 'text.dart';
import 'show.dart';
import 'enter.dart';
import 'entershow.dart';
import 'listview.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return buildContainer(index);
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Go to Login'),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const AboutPage(),
    const CalculatorPage(),
    const GradeBookPage(),
    const Screen1(),
    const Screen2(),
    const Screen3(),
    EnterScreen(),
    EnterShowScreen(email: "", phone: "", status: ""),
    const ListViewScreen(),
    const LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40),
            const SizedBox(width: 10),
            const Text("Baba Guru Nanak University"),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: const Footer(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(int) onTap;
  const AppDrawer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 60),
                const SizedBox(height: 10),
                const Text(
                  "BGNU Navigation",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(title: const Text("Home"), onTap: () => onTap(0)),
          ListTile(title: const Text("About"), onTap: () => onTap(1)),
          ListTile(title: const Text("Calculator"), onTap: () => onTap(2)),
          ListTile(title: const Text("Grade Book"), onTap: () => onTap(3)),
          ListTile(title: const Text("List"), onTap: () => onTap(4)),
          ListTile(
            title: const Text("Enter Data"),
            onTap: () => onTap(7),
          ),
          ListTile(
            title: const Text("View Data"),
            onTap: () => onTap(8),
          ),
          ListTile(
            title: const Text("Button"),
            onTap: () => onTap(4),
          ),
          ListTile(
            title: const Text("TextBox"),
            onTap: () => onTap(5),
          ),
          ListTile(
            title: const Text("Show"),
            onTap: () => onTap(6),
          ),
          ListTile(
            title: const Text("List View"),
            onTap: () => onTap(9),
          ),
          ListTile(
            title: const Text("Login"),
            onTap: () {
              onTap(10); // This will navigate to LoginScreen
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Contact Us",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Address: Adampur Road, Nankana Sahib, Pakistan",
            style: TextStyle(color: Colors.white),
          ),
          Text("Phone: +123 456 789", style: TextStyle(color: Colors.white)),
          Text(
            "Email: info@bgnuniversity.com",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "© 2025 Baba Guru Nanak University. All rights reserved.",
            style: TextStyle(color: Colors.yellow, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 100),
          const SizedBox(height: 20),
          const Text(
            "Welcome to Baba Guru Nanak University!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/vc_sahib.jpg', height: 150),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset('assets/vc_sahib.jpg', height: 200),
          const SizedBox(height: 20),
          const Text(
            "Baba Guru Nanak University is dedicated to providing quality education and fostering innovation. We aim to build a future-ready generation through academic excellence and research.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class GradeBookPage extends StatelessWidget {
  const GradeBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            "Grade Book",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          DataTable(
            columns: const [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Subject")),
              DataColumn(label: Text("Grade")),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text("Churail")),
                  DataCell(Text("Math")),
                  DataCell(Text("A")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("Atma")),
                  DataCell(Text("PF")),
                  DataCell(Text("B+")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("Jin")),
                  DataCell(Text("Oops")),
                  DataCell(Text("A-")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController value1Controller = TextEditingController();
  TextEditingController value2Controller = TextEditingController();
  String result = "";

  void calculate(String operation) {
    double num1 = double.tryParse(value1Controller.text) ?? 0;
    double num2 = double.tryParse(value2Controller.text) ?? 0;
    double res = 0;

    switch (operation) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res =
            num2 != 0 ? num1 / num2 : double.infinity; // Avoid division by zero
        break;
    }

    setState(() {
      result = "Result: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: value1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Enter first number"),
          ),
          TextField(
            controller: value2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Enter second number"),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => calculate('+'),
                child: const Text("+"),
              ),
              ElevatedButton(
                onPressed: () => calculate('-'),
                child: const Text("-"),
              ),
              ElevatedButton(
                onPressed: () => calculate('*'),
                child: const Text("*"),
              ),
              ElevatedButton(
                onPressed: () => calculate('/'),
                child: const Text("/"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            result,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

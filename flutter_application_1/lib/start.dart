import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Create a variable to track the selected option in the sidebar
  String _selectedOption = '';

  // Function to handle option selection from the sidebar
  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  // Background image URL
  final String backgroundImageUrl =
      'https://img.freepik.com/free-vector/hand-drawn-world-mental-health-day_52683-44659.jpg?size=626&ext=jpg&ga=GA1.2.793204570.1683608959&semt=ais';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey Buddy!!!'),
      ),
      body: Container(
        // Set the background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Welcome to the Mental Health Companion App!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sidebar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: _selectedOption == 'settings',
              onTap: () {
                _selectOption('settings');
                // Add your code to navigate to the settings page here
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contact'),
              selected: _selectedOption == 'contact',
              onTap: () {
                _selectOption('contact');
                // Add your code to navigate to the contact page here
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, 'home');
        },
        label: const Text('Start Survey'),
        icon: const Icon(Icons.poll),
      ),
    );
  }
}

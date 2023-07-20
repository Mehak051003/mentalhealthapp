import 'package:flutter/material.dart';
import 'package:flutter_application_1/home1.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHome> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YxttjNvpyBnMiBDYY9TLY5BG8TRnQ-5voA&usqp=CAU',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80), // Add space from the top
            const Text(
              'How was your day?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Change the font color to white
              ),
            ),
            const SizedBox(height: 20),
            _buildOption('Fine'),
            _buildOption('Awful'),
            _buildOption('Great'),
            const SizedBox(
              height: 25,
            ), // Add a gap between the question and options
            _selectedOption != null
                ? TextButton(
                    onPressed: () {
                      // Navigate to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 18), // Change the font size
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String option) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<String>(
          value: option,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
        Text(
          option,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black, // Change the font color to white
          ),
        ),
      ],
    );
  }
}

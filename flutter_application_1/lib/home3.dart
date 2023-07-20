import 'package:flutter/material.dart';
import 'package:flutter_application_1/eva.dart';

class NextPage2 extends StatefulWidget {
  const NextPage2({Key? key}) : super(key: key);

  @override
  State<NextPage2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NextPage2> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health App'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 207, 220), // Add background color
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'How happy you are?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildOption('10%'),
            _buildOption('50%'),
            _buildOption('100%'),
            const SizedBox(
              height: 20,
            ), // Add a gap between the question and options
            _selectedOption != null
                ? TextButton(
                    onPressed: () {
                      // Navigate to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Evaluate(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    child: const Text('Next'),
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
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

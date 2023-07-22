import 'package:flutter/material.dart';
import 'package:flutter_application_1/home2.dart';

class NextPage extends StatefulWidget {
  final int score; // Receive the score from the previous page
  const NextPage({Key? key, required this.score}) : super(key: key);

  @override
  State<NextPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NextPage> {
  String? _selectedOption;
  int _selectedOptionScore = 0; // Initialize score to 0

  // Define a function to update the score based on the selected option
  void _updateScore(String option) {
    if (option == '10-50') {
      _selectedOptionScore = 1;
    } else if (option == '51-200') {
      _selectedOptionScore = 2;
    } else if (option == '201-500') {
      _selectedOptionScore = 3;
    }
  }

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
              'How many people did you meet?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Change the font color to white
              ),
            ),
            const SizedBox(height: 20),
            _buildOption('10-50'),
            _buildOption('51-200'),
            _buildOption('201-500'),
            const SizedBox(
              height: 25,
            ), // Add a gap between the question and options
            _selectedOption != null
                ? TextButton(
                    onPressed: () {
                      // Update the score based on the selected option
                      _updateScore(_selectedOption!);

                      // Calculate the total score (previous score + current score)
                      int totalScore = widget.score + _selectedOptionScore;

                      // Navigate to the next page and pass the total score
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage1(score: totalScore),
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

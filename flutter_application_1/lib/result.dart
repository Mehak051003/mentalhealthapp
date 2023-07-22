import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class MyWid extends StatefulWidget {
  final int score; // Receive the score from the previous page
  const MyWid({Key? key, required this.score}) : super(key: key);

  @override
  State<MyWid> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWid> {
  @override
  Widget build(BuildContext context) {
    String imageUrl1 =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoySdWYmE_bicJpoDLSrfQS8mt44cc3rm4A7swXHnGRA&s';
    String imageUrl2 =
        'https://millennialships.com/wp-content/uploads/2018/08/How-to-meet-new-people.jpg';

    String resultText = '';
    String suggestion1Text = '';
    String suggestion2Text = '';

    // Customize the result and suggestions based on the received score
    if (widget.score <= 4) {
      // Low score result and suggestions
      resultText = 'You may be experiencing significant anxiety.';
      suggestion1Text = 'Seek professional help or counseling.';
      suggestion2Text = 'Engage in self-care activities and take breaks.';
    } else if (widget.score > 4 && widget.score <= 7) {
      // Medium score result and suggestions
      resultText = 'You may have some stress or anxiety.';
      suggestion1Text = 'Practice relaxation techniques.';
      suggestion2Text = 'Talk to someone you trust about your feelings.';
    } else {
      // High score result and suggestions
      resultText = 'You seem to be doing well!';
      suggestion1Text = 'Continue your positive habits!';
      suggestion2Text = 'Consider trying new activities.';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result and Suggestions'),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.logout), // You can use any logout icon you prefer
            onPressed: () {
              // Navigate back to the login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyLogin()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            imageUrl1,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16), // Add space from the top
              Text(
                resultText,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              _buildImageWithText(imageUrl1, suggestion1Text),
              _buildImageWithText(imageUrl2, suggestion2Text),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithText(String imageUrl, String text) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

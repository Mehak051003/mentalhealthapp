import 'package:flutter/material.dart';

class MyWid extends StatefulWidget {
  const MyWid({Key? key}) : super(key: key);

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result and Suggestions'),
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
              const Text(
                'You have Anxiety!!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              _buildImageWithText(imageUrl1, 'Listen music'),
              _buildImageWithText(imageUrl2, 'Meet people'),
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

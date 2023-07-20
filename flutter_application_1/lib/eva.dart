import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';

class Evaluate extends StatefulWidget {
  const Evaluate({Key? key}) : super(key: key);

  @override
  State<Evaluate> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Evaluate> {
  bool isEvaluating = false;

  void startEvaluation() {
    // Simulate evaluation process (you can replace this with your actual evaluation logic)
    setState(() {
      isEvaluating = true;
    });

    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        isEvaluating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluate Result'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMeuAyf_GYgpL9hg5EbeCnIAVngHR6wQslSA&usqp=CAU',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: isEvaluating
                    ? const Center(
                        child: Text(
                          'Evaluating...',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMeuAyf_GYgpL9hg5EbeCnIAVngHR6wQslSA&usqp=CAU',
                        fit: BoxFit.cover,
                      ),
              ),
              Center(
                // Centered Start Button
                child: ElevatedButton(
                  onPressed: () {
                    startEvaluation();
                  },
                  child: const Text('Start'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Evaluate',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                // Centered Done Button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Result page when the "Done" button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyWid(),
                      ),
                    );
                  },
                  child: const Text('Finished'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

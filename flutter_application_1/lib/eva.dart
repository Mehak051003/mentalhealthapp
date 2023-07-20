import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';

class Evaluate extends StatefulWidget {
  final int score; // Receive the score from the previous page
  const Evaluate({Key? key, required this.score}) : super(key: key);

  @override
  State<Evaluate> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Evaluate>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startEvaluation() {
    // Simulate evaluation process (you can replace this with your actual evaluation logic)
    setState(() {
      isStarted = true;
      _animationController.repeat();
    });

    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        isStarted = false;
        _animationController.stop();
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
            'https://plus.unsplash.com/premium_photo-1663840297018-fe653527fc32?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                // Centered Start Button
                child: ElevatedButton(
                  onPressed: () {
                    startEvaluation();
                  },
                  child: const Text('Start'),
                ),
              ),
              Expanded(
                child: Center(
                  child: isStarted
                      ? RotationTransition(
                          turns: _animationController,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pink,
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
                        )
                      : Container(), // Hide the Evaluate circle when not started
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
                        builder: (context) => MyWid(score: widget.score),
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

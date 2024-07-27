import 'package:flutter/material.dart';
import 'package:questions/Screens/home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset('images/logo.gif'),
              const Text(
                'Welcome To Questions App',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              IconButton(
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        )
                    );
                  },
                  icon: const Icon(Icons.arrow_forward))
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
    const WelcomeScreen({Key? key}) : super(key: key);


    @override
    State<WelcomeScreen> createState() => _WelcomeScreenState();
    
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _textOpacity = 0.0;
  double _buttonOpacity = 0.0;
  double _lineWidth = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
            _textOpacity = 1.0;
        });
    });
    Future.delayed(const Duration(milliseconds: 1300), () {
        setState(() {
            _buttonOpacity = 1.0;
        });
    });
    // Animate the line after the text is visible
    Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
        _lineWidth = 120.0; // Final width of the line
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                    Colors.blue,      // First color
                                    Colors.black,    // Second color
                                    Colors.black,    // Third color
                                    Colors.green,    // Fourth color
                                ],
                                stops: [0.0, 0.3, 0.7, 1.0], // Where each color starts
                            ),
                        ),
                    ),
                    Positioned.fill(
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 250, sigmaY: 40),
                            child: Container(
                                color: Colors.transparent,
                            ),
                        ),
                    ),

                   Center(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                SizedBox(height: 400),
                                AnimatedOpacity(
                                    opacity: _textOpacity,
                                    duration: const Duration(seconds: 2),
                                    child: Text(
                                            'Welcome to Less',
                                            style: TextStyle(color: Colors.white, fontSize: 38),
                                
                                    ),
                                ),
                                AnimatedContainer(
                                    duration: const Duration(milliseconds:800),
                                    curve: Curves.easeOutCubic,
                                    margin: const EdgeInsets.only(top: 12, bottom: 100),
                                    height: 2,
                                    width: _lineWidth,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(2),
                                    ),
                                ),

                                Spacer(),
                                
                                AnimatedOpacity(
                                    opacity: _buttonOpacity,
                                    duration: const Duration(seconds: 2),

                                    child: ElevatedButton(
                                        onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => LoginScreen()),
                                            );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green.withOpacity(0.8),
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30),
                                            ),
                                            elevation: 8,
                                            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        child: const Text('Enter'),
                                    ),
                                ),
                                SizedBox(height: 170),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
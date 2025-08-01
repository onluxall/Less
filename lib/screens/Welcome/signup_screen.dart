import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_demo/screens/Home/home_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  void _checkFields() {
    setState(() {
      _isButtonEnabled =
        _usernameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _passwordController.text.trim().isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkFields);
    _emailController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Add this line
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Hide keyboard
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.black,
                    Colors.black,
                    Colors.green,
                  ],
                  stops: [0.0, 0.3, 0.7, 1.0],
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
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Text(
                      "Hello There",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Let's create an account",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 211, 211, 211),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 100),
                    Container(
                      width: 300,
                      height: 420,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max, // Only take needed space
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _usernameController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),


                            SizedBox(height: 20),
                            TextField(
                              controller: _emailController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: _passwordController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 110),
                            ElevatedButton(
                              onPressed: _isButtonEnabled
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  }
                                : null,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.disabled)) {
                                      return Colors.grey.withOpacity(0.2); // Grey when disabled
                                    }
                                    return Colors.green; // Green when enabled
                                  },
                                ),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all<double>(8),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              child: const Text('Continue'),
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
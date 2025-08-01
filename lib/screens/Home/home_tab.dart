import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_demo/widgets/Focus_Timer.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background gradient and blur
          Container(
            decoration: const BoxDecoration(
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
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              
              child: Container(
                decoration: const BoxDecoration(
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
            ),
          ),

          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Good morning!',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.sunny, color: Colors.yellow, size: 28),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Let\'s make today a little less overwhelming',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                

                Container(
                  height: 270,
                  decoration: BoxDecoration(
                    
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(Icons.timer_outlined, color: Colors.blue, size: 22),
                            const SizedBox(width: 10),
                            Text(
                              'Focus Timer'
                              , style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),

                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Center(child: FocusTimer()),
                        
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle_outline, color: Colors.green, size: 24),
                              const SizedBox(width: 8),                                                       
                              Text(
                                '5',
                                style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                           const SizedBox(height: 5),
                          Text(
                            'Daily Wins',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                       
                    ),
                    Spacer(),
                    Container(
                      height: 120,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lightbulb_outline, color: Colors.yellow, size: 24),
                              const SizedBox(width: 8),                                                       
                              Text(
                                '75%',
                                style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                           const SizedBox(height: 5),
                          Text(
                            'Energy Level',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),      //Information cards
                const SizedBox(height: 20),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(Icons.bar_chart_outlined, color: Colors.blue, size: 22),
                            const SizedBox(width: 10),
                            Text(
                              'Daily Progress',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tasks Completed', style: TextStyle(color: Colors.white70)),
                                Text('8/10', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            LinearProgressIndicator(
                              value: 0.8,
                              backgroundColor: Colors.white24,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Focus Time', style: TextStyle(color: Colors.white70)),
                                Text('3h 45m', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            LinearProgressIndicator(
                              value: 0.75,
                              backgroundColor: Colors.white24,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
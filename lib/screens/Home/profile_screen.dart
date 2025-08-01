import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/Welcome/login_screen.dart';
import 'dart:ui';

import 'package:flutter_switch/flutter_switch.dart' as flutterswitch;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background gradient
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

          // Blur effect
        
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 65),
            child: Column(
              children: [
                // Profile Card
                Container(
                  height: 250,
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
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Less User',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Less user since 2023',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Next level:', style: TextStyle(color: Colors.white, fontSize: 13)),
                            Spacer(),
                            Text('350/500', style: TextStyle(color: Colors.white, fontSize: 13)),
                          ],
                        ),
                        SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                
                
                // Grid of Cards
                GridView.count(
                  padding: EdgeInsets.only(top: 25, bottom: 25),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildInfoCard(Icons.notifications_outlined, '42', 'Focus Sessions'),
                    _buildInfoCard(Icons.check, '23', 'Tasks Simplified', iconColor: Colors.green),
                    _buildInfoCard(Icons.monitor_heart_outlined, '152', 'Mindful Minutes', iconColor: Colors.red),
                    _buildInfoCard(Icons.calendar_month, '9', 'Streak Days'),
                  ],
                ),
                
                Container(
                  height: 300,
                  
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
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.emoji_events_outlined, color: Colors.green,),
                          SizedBox(width: 10),
                          Text(
                            'Achievements',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      
                      Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.emoji_events, color: Colors.yellow),
                                title: Text('Achievement ${index + 1}', style: TextStyle(color: Colors.white)),
                                subtitle: Text('Description of achievement ${index + 1}', style: TextStyle(color: Colors.white70)),
                              );
                            },
                          ),
                      ),
                    ],
                  ),
                ), // Achivments

                SizedBox(height: 25),

                Container(
                  height: 300,
                  
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
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.settings_outlined, color: Colors.lightBlueAccent),
                          SizedBox(width: 10),
                          Text(
                            'Settings',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      
                      
                      Column(
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.nightlight_round_outlined, color: Colors.grey),
                                  SizedBox(width: 10),
                                  
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      Text('Dark Mode', style: TextStyle(color: Colors.white, fontSize: 16)),
                                      Text('Easier on the eyes', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                    ],
                                  ),
                                  Spacer(),
                                  flutterswitch.FlutterSwitch(
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.grey.withOpacity(0.2),
                                    activeTextColor: Colors.transparent,
                                    inactiveTextColor: Colors.transparent,  
                                    width: 50.0,
                                    height: 25.0,
                                    valueFontSize: 12.0,
                                    toggleSize: 20.0,
                                    value: true,
                                    borderRadius: 30.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    
                                    onToggle: (val) {
                                      // Handle toggle action
                                    },
                                  ), 
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.notifications_outlined, color: Colors.grey),
                                  SizedBox(width: 10),
                                  
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      Text('Gentle Reminders', style: TextStyle(color: Colors.white, fontSize: 16)),
                                      Text('Soft notifications', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                    ],
                                  ),
                                
                                  Spacer(),
                                  flutterswitch.FlutterSwitch(
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.grey.withOpacity(0.2),
                                    activeTextColor: Colors.transparent,
                                    inactiveTextColor: Colors.transparent,  
                                    width: 50.0,
                                    height: 25.0,
                                    valueFontSize: 12.0,
                                    toggleSize: 20.0,
                                    value: false,
                                    borderRadius: 30.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      // Handle toggle action
                                    },
                                  ), 
                                  
                                  
                                ],
                              ),
                            ),
                            SizedBox(height: 16), 
                            
                            SizedBox(
                              width: 330,
                              child: ElevatedButton(
                                onPressed: () {
                              
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  backgroundColor: Colors.grey.withOpacity(0.2), 
                                  foregroundColor: Colors.white,
                                  
                                ),

                                child: Row(    
                                  children: [
                                    Icon(Icons.person_outlined, size: 20),
                                    SizedBox(width: 8),
                                    Text('Edit Profile', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 330,
                              child: ElevatedButton(
                                onPressed: () {
                              
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  backgroundColor: Colors.grey.withOpacity(0.2), 
                                  foregroundColor: Colors.white,
                                  
                                ),

                                child: Row(    
                                  children: [
                                    Icon(Icons.bar_chart_outlined, size: 20),
                                    SizedBox(width: 8),
                                    Text('View Detailed Stats', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                          ],                          
                        ), 
                    ],
                  ),
                ),  //Settings 

                SizedBox(height: 25),
                
                Container(  //support 
                  height: 220,
                  
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
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            'Support & Feedback',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      
                      
                      Column(
                          children: [
                            SizedBox(height: 16), 
                            
                            SizedBox(
                              width: 330,
                              child: ElevatedButton(
                                onPressed: () {
                              
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  backgroundColor: Colors.grey.withOpacity(0.2), 
                                  foregroundColor: Colors.white,
                                  
                                ),

                                child: Row(    
                                  children: [
                                    Icon(Icons.chat_bubble_outline, size: 20),
                                    SizedBox(width: 8),
                                    Text('Send Feedback', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 330,
                              child: ElevatedButton(
                                onPressed: () {
                              
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  backgroundColor: Colors.grey.withOpacity(0.2), 
                                  foregroundColor: Colors.white,
                                  
                                ),

                                child: Row(    
                                  children: [
                                    Icon(Icons.bookmarks_outlined, size: 20),
                                    SizedBox(width: 8),
                                    Text('ADHD Resources', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 330,
                              child: ElevatedButton(
                                onPressed: () {
                              
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  backgroundColor: Colors.grey.withOpacity(0.2), 
                                  foregroundColor: Colors.white,
                                  
                                ),

                                child: Row(    
                                  children: [
                                    Icon(Icons.handshake_outlined, size: 20),
                                    SizedBox(width: 8),
                                    Text('Community', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                          ],                          
                        ), 
                    ],
                  ),
                ), // support

                SizedBox(height: 20),
                
                            SizedBox(       // sign out 
                              width: 360,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                  );
                              },
                                style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  backgroundColor: Colors.grey.withOpacity(0.1), 
                                  foregroundColor: Colors.white,
                                  
                                ),

                                child: Row(    
                                  children: [
                                    Icon(Icons.exit_to_app_outlined, size: 20, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text('Sign Out', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                SizedBox(height: 35),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String value, String label, {Color iconColor = Colors.white}) {
    return Container(
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Icon(icon, size: 24, color: iconColor),
            
            Text(value, style: TextStyle(color: Colors.white, fontSize: 40)),
            
            Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
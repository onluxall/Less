import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class LessScreen extends StatefulWidget {
  const LessScreen({Key? key}) : super(key: key);

  @override
  State<LessScreen> createState() => _LessScreenState();
}

class _LessScreenState extends State<LessScreen> {
  int? selectedIndex;

  final List<String> labels = [
    'Simplify',
    'Focus Mode',
    'Energy Check',
    'Calm Corner',
  ];

  void onBoxTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      selectedIndex = index;
    });
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.lightbulb_outline;
      case 1:
        return Icons.center_focus_strong;
      case 2:
        return Icons.bolt;
      case 3:
        return Icons.favorite_border;
      default:
        return Icons.circle;
    }
  }

  Widget _buildSelectedWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        '${labels[index]} Selected',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
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
              child: Container(color: Colors.transparent),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Less',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Making complex things simple, one step at a time',
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
        
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(labels.length, (index) {
                      return GestureDetector(
                        onTap: () => onBoxTapped(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: (MediaQuery.of(context).size.width - 52) / 2,
                          height: 120,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.green
                                : Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(_getIcon(index), color: Colors.white),
                              const SizedBox(height: 8),
                              Text(
                                labels[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  if (selectedIndex != null) _buildSelectedWidget(selectedIndex!)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
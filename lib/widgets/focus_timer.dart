import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({Key? key}) : super(key: key);

  @override
  _FocusTimerState createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer> {
  Duration duration = Duration.zero;
  Timer? timer;
  bool isRunning = false;
  DateTime? startTime;

  @override
  void initState() {
    super.initState();
    _loadTimerState();
  }

  void _loadTimerState() async {
    final prefs = await SharedPreferences.getInstance();
    final millis = prefs.getInt('startTime');
    final running = prefs.getBool('isRunning') ?? false;

    if (millis != null && running) {
      startTime = DateTime.fromMillisecondsSinceEpoch(millis);
      isRunning = true;
      _startTicker();
    }
  }

  void startTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();

    final resumedStartTime = now.subtract(duration);

    await prefs.setInt('startTime', resumedStartTime.millisecondsSinceEpoch);
    await prefs.setBool('isRunning', true);

    setState(() {
      startTime = resumedStartTime;
      isRunning = true;
    });

    _startTicker();
  }

  void _startTicker() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (!isRunning || startTime == null) return;
      final now = DateTime.now();
      setState(() {
        duration = now.difference(startTime!);
      });
    });

    // Trigger immediate update
    if (startTime != null) {
      setState(() {
        duration = DateTime.now().difference(startTime!);
      });
    }
  }

  void stopTimer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('startTime');
    await prefs.setBool('isRunning', false);

    timer?.cancel();
    setState(() {
      isRunning = false;
      startTime = null;
    });
  }

  void saveAndRestartTimer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('startTime');
    await prefs.setBool('isRunning', false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Saved time: ${_formatTime(duration)}')),
    );

    timer?.cancel();
    setState(() {
      duration = Duration.zero;
      isRunning = false;
      startTime = null;
    });
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String _formatTime(Duration d) {
    return "${_twoDigits(d.inHours)}:${_twoDigits(d.inMinutes % 60)}:${_twoDigits(d.inSeconds % 60)}";
  }

  Widget _buildTimeBox(String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      ),
    );
  }

  Widget _buildIconButton() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: IconButton(
        icon: Icon(Icons.dashboard_outlined, color: Colors.white),
        onPressed: saveAndRestartTimer,
        tooltip: 'Save & Restart',
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _twoDigits(duration.inHours);
    final minutes = _twoDigits(duration.inMinutes.remainder(60));
    final seconds = _twoDigits(duration.inSeconds.remainder(60));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Time display in rounded boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeBox(hours),
            const SizedBox(width: 10),
            _buildTimeBox(minutes),
            const SizedBox(width: 10),
            _buildTimeBox(seconds),
          ],
        ),
        const SizedBox(height: 30),

        // Buttons: Start/Stop and Save & Restart
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: ElevatedButton(
                onPressed: isRunning ? stopTimer : startTimer,
                child: Text(isRunning ? 'Stop' : 'Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isRunning
                      ? Colors.green.withOpacity(0.2)
                      : Colors.white.withOpacity(0.1),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: BorderSide(
                    color: isRunning ? Colors.green : Colors.white.withOpacity(0.4),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
              ),
            ),
            const SizedBox(width: 20),
            _buildIconButton(),
          ],
        ),
      ],
    );
  }
}
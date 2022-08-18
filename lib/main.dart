import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller2 = CountDownController();
  bool isRunning = true;

  void onEnd() {
    print('Process Completed. Restarting timer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Text(
              'Countdown',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
            SizedBox(height: 180.0),
            Visibility(
              visible: isRunning,
              child: SizedBox(
                height: 200,
                width: 200,
                child: CountDownProgressIndicator(
                  controller: controller2,
                  valueColor: Colors.red,
                  backgroundColor: Colors.green,
                  initialPosition: 0,
                  duration: 10,
                  // text: 'SEC',
                  text: 'm:s',
                  onComplete: () {
                    setState(() {
                      isRunning = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Hey Joe! Out of time')));
                  },
                ),
              ),
            ),
            Visibility(
              visible: !isRunning,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    controller2.start();
                    setState(() {
                      isRunning = true;
                    });
                  },
                  child: Text('Resend OTP')),
            )
          ],
        ),
      )),
    );
  }
}

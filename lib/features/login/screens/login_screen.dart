import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        width: 1000,
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      const SizedBox(height: 150.0),
                      Text(
                        '보고, 듣고, 넘기면',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      const Text(
                        '암기되는 영어 플랫폼',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Wonder',
                        style: TextStyle(
                          fontSize: 46.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/playing');
                      },
                      child: const Text('Apple로 시작하기'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 70,
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 219, 219, 219),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/playing');
                      },
                      child: const Text('Google로 시작하기'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

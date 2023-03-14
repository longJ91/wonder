import 'package:flutter/material.dart';
import 'landing/screens/landing_end_screen.dart';
import 'landing/screens/landing_middle_screen.dart';
import 'landing/screens/landing_start_screen.dart';
import 'login/screens/login_screen.dart';
import 'playing/screens/playing_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromARGB(55, 181, 31, 31),
                ))),
      ),
      initialRoute: '/landing/start',
      routes: {
        '/landing/start': (context) => const LandingPageStart(),
        '/landing/middle': (context) => const LandingPageMiddle(),
        '/landing/end': (context) => const LandingPageEnd(),
        '/login': (context) => const LoginPage(),
        '/playing': (context) => const TapsWidget(),
      },
    );
  }
}

class TapsWidget extends StatefulWidget {
  const TapsWidget({super.key});

  @override
  State<TapsWidget> createState() => TapsWidgetState();
}

class TapsWidgetState extends State<TapsWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    const PlayingView(),
    const DiagleTest(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wonder'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video_rounded),
            label: 'Wonder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}

class DiagleTest extends StatelessWidget {
  const DiagleTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const Text(
              "This is a Custom Dialog",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"))
          ],
        ),
      ),
    );
  }
}

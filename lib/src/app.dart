import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../example_candidate_model.dart';
import 'example_card.dart';

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
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Example(),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
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
        onTap: _onItemTapped,
      ),
    );
  }
}

class Example extends StatelessWidget {
  final cards = candidates.map((candidate) => ExampleCard(candidate)).toList();
  Example({super.key});

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: const Size(88, 100),
    padding: const EdgeInsets.symmetric(horizontal: 2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 1,
              // fit: FlexFit.tight,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                // height: MediaQuery.of(context).size.height * 1,
              )),
          Flexible(
            child: SizedBox(
              // color: Colors.blueGrey,
              width: MediaQuery.of(context).size.width * 0.8,
              // height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color(0xFFE0E0E0),
                        ),
                        // width: MediaQuery.of(context).size.wid
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8 / 3,
                        height: 10,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color(0xFF64B5F6),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "1/50",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 14,
            fit: FlexFit.tight,
            child: CardSwiper(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              cards: cards,
            ),
          ),
          Flexible(
            flex: 4,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('힌트보기')),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('소리듣기')),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Row(
              children: [
                Flexible(
                  child: Center(
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: SizedBox(
                      width: 78,
                      height: 78,
                      child: FittedBox(
                          child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: const Icon(
                          Icons.close_rounded,
                          size: 40,
                          color: Color.fromARGB(255, 247, 113, 104),
                        ),
                      )),
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: SizedBox(
                      width: 78,
                      height: 78,
                      child: FittedBox(
                          child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite,
                          size: 38,
                          color: Colors.blue,
                        ),
                      )),
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

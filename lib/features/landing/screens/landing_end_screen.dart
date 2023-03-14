import 'package:flutter/material.dart';

class LandingPageEnd extends StatelessWidget {
  const LandingPageEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(right: 40.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // 클릭 이벤트 처리 코드
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Image.asset(
                  'assets/images/landing_image_03.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    const Flexible(child: SizedBox(height: 50.0)),
                    const Text(
                      '지루하지 않은 영어 콘텐츠',
                      style: TextStyle(
                        fontSize: 33.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      '미국에서 실제로 쓰이는 영어 위주의 단어로',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    const Text(
                      '원더는 적용가능한 콘텐츠를 제공합니다',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 6.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 5.0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 6.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 5.0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 6.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 5.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('시작하기'),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '이미 계정이 있으신가요? 바로 ',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 클릭 이벤트 처리 코드
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          '로그인하세요',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

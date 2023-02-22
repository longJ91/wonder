import 'package:flutter/cupertino.dart';

class ExampleCandidateModel {
  String name;
  String job;
  String city;
  List<Color> color;

  ExampleCandidateModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
  });
}

List<String> words = [
  'Apple',
  'Banana',
  'Acrimony',
];

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: words[0],
    job: '${words[0]} 은 빨간색 과일이며 아이폰을 만드는 회사의 이름이다',
    city: 'Areado',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  ExampleCandidateModel(
    name: words[1],
    job: '길고 노란색 껍질을 가지고 있는 과일은 ${words[1]} 이다',
    city: 'New York',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  ExampleCandidateModel(
    name: words[2],
    job: '이란과 사우디는 오랜 전쟁으로 인해 서로에 대한 ${words[2]}를 가지고 있다',
    city: 'London',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
];

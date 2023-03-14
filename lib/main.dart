import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:word/wonder_observer.dart';
import 'features/app.dart';

void main() {
  Bloc.observer = WonderObserver();
  runApp(const App());
}

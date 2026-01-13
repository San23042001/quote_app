import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/app.dart';
import 'package:quote_app/get_it/injectable.dart';
import 'package:quote_app/presentation/cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const QuoteApp());
}

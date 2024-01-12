import 'package:flutter/material.dart';
import 'package:practice_provider/providers/fav_provider.dart';
import 'package:practice_provider/providers/slider_provider.dart';
import 'package:practice_provider/screens/slider_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SliderScreen(),
      ),
    );
  }
}

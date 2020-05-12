import 'package:find_the_number/pages/home_page.dart';
import 'package:find_the_number/pages/number_game_page.dart';
import 'package:find_the_number/pages/select_char_page.dart';
import 'package:find_the_number/pages/word_game_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find the Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        NumberGamePage.routeName: (_) => NumberGamePage(),
        WordGamePage.routeName: (_) => WordGamePage(),
        SelectCharPage.routeName: (_) => SelectCharPage(),
      },
    );
  }
}

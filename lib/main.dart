import 'package:flutter/material.dart';
import 'package:meriyan/screens/favourites.dart';
import 'package:meriyan/screens/home.dart';
import 'package:meriyan/screens/tours.dart';

void main(List<String> args) {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const App(),
      theme: ThemeData(
          primaryColor: const Color(0xff005760),
          textTheme: const TextTheme(
            headline1: TextStyle(
                  fontSize: 32,
                  color: Color(0xff005760),
                  fontWeight: FontWeight.bold,
              ),
            headline2: TextStyle(
                fontSize: 24,
                color: Color(0xff005760),
                fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
                fontSize: 21,
                color: Color(0xff005760),
                fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
                color: Color(0xff005760),
            )
          )
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, 
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: const Text("meriyan.ru"),
                bottom: const TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                        Tab(
                            icon: Icon(Icons.card_travel),
                        ),
                        Tab(
                            icon: Icon(Icons.info),
                        ),
                        Tab(
                            icon: Icon(Icons.favorite),
                        )
                    ],
                ),
            ),
            body: const TabBarView(
                children: [
                    ToursScreen(),
                    HomeScreen(),
                    ContactsScreen()
                ],
            ),
        ),
    );
  }
}
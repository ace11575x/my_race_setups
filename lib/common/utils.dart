import 'package:flutter/material.dart';
import 'package:my_race_setups/pages/home.dart';
import 'package:my_race_setups/pages/track.dart';
import 'package:english_words/english_words.dart';
import 'package:my_race_setups/pages/setup.dart';
import 'package:my_race_setups/pages/car.dart';

class MyDrawerDirectory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: Text('Home'), onTap: () => _navPush(context, MyHomePage())),
          ListTile(title: Text('Tracks'), onTap: () => _navPush(context, TracksPage())),
          ListTile(title: Text('Cars'), onTap: () => _navPush(context, CarsPage())),
          ListTile(title: Text('Setups'), onTap: () => _navPush(context, SetupsPage())),
        ],
      ),
    );
  }

  Future<dynamic> _navPush(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",)
      ),
    );
  }
}



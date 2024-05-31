import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_race_setups/main.dart';
import 'package:my_race_setups/common/utils.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<MyAppState>();
    var pair = appstate.current;

    return Scaffold(
      appBar: AppBar(
        title: Text("Burger"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(
              height: 10,
            ),
            //Button addition
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      appstate.getNext();
                    },
                    child: Text('Next')),
              ],
            )
          ],
        ),
      ),
      drawer: MyDrawerDirectory(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'MyRaceSetups',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_race_setups/common/utils.dart';

class CarsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks'),
      ),
      body: Center(
        child: Text('This page will be held for Cars. '),
      ),
      drawer: MyDrawerDirectory(), // ← Drawer Directory a.k.a. burger icon
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_race_setups/common/utils.dart';
import 'package:my_race_setups/models/track.dart';

class TracksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            )
            ),
            Expanded(child: TrackForm())
          ],
        ),
      ),
      drawer: MyDrawerDirectory(), // ← Drawer Directory a.k.a. burger icon
    );
  }
}

class TrackForm extends StatefulWidget {
  @override
  TrackFormState createState() => TrackFormState();
}

class TrackFormState extends State<TrackForm> {
  final trackLabels = [
    'Track Name',
    'Track Size',
    'Track Composition',
    // Add more labels here
  ];

  final trackHintTexts = [
    'Track Name Here',
    'Track Size Here',
    'Track Composition Here',
    // Add more hint texts here
  ];

  List<TextEditingController> controllers = List.generate(
    3, (index) => TextEditingController()
    );

  @override
  void dispose() {
  for (var controller in controllers) {
    controller.dispose();
  }
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(trackLabels[index]),
                    TextField(
                      controller: controllers[index],
                      decoration: InputDecoration(
                        hintText: trackHintTexts[index],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle save button press
                String name = controllers[0].text;
                String size = controllers[1].text;
                String comp = controllers[2].text;

                Track.addTrackToBox(name, size, comp);
              },
              child: Text('Save'),
            ),
            ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('New Text'))
          ],
        )
      ],
    );
  }
}
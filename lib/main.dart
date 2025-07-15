import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Fare Aggregator',
      home: RideSearchScreen(),
    );
  }
}

class RideSearchScreen extends StatefulWidget {
  @override
  _RideSearchScreenState createState() => _RideSearchScreenState();
}

class _RideSearchScreenState extends State<RideSearchScreen> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find Your Ride')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: pickupController,
              decoration: InputDecoration(labelText: 'Pickup Location'),
            ),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(labelText: 'Destination'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Here, you can call your API or mock function
                print("Pickup: ${pickupController.text}, Destination: ${destinationController.text}");
              },
              child: Text('Get Ride Prices'),
            ),
          ],
        ),
      ),
    );
  }
}

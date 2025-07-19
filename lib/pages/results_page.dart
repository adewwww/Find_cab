import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final destination = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Rides to $destination")),
      body: Column(
        children: [
          ToggleButtons(
            isSelected: [true, false],
            children: const [Text("Cheapest"), Text("Fastest")],
            onPressed: (index) {
              // TODO: Sort logic
            },
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.local_taxi),
                  title: Text("Uber"),
                  trailing: Text("₹120"),
                ),
                ListTile(
                  leading: Icon(Icons.motorcycle),
                  title: Text("Rapido"),
                  trailing: Text("₹60"),
                ),
                ListTile(
                  leading: Icon(Icons.local_taxi_outlined),
                  title: Text("Ola"),
                  trailing: Text("₹100"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

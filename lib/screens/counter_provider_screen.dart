import "package:api_intigration_tutorial/provider/count_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CounterProviderScreen extends StatefulWidget {
  const CounterProviderScreen({super.key});

  @override
  State<CounterProviderScreen> createState() => _CounterProviderScreenState();
}

class _CounterProviderScreenState extends State<CounterProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("counterProviderscreen"),
        backgroundColor: Colors.cyan,
      ),
      body: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Center(
            child: Text(
              value.count.toString(),
              style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countProvider.setCount,
        child: const Icon(Icons.add),
      ),
    );
  }
}

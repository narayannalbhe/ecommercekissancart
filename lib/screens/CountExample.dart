import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/CountProvider.dart';

class CountExample extends StatefulWidget {
  CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  var count = 0;

  incrementCount() {
    setState(() {

    });
    return count++;

  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Count example"),),
      body:  Consumer<CountProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(countProvider.count.toString(),style: const TextStyle(
                  fontSize: 18
              ),)
            ],
          );
        },
      ),
      floatingActionButton:
          ElevatedButton(
              onPressed: (){
                countProvider.setCount();
              },
              child: const Text("Increment")),
    );
  }
}

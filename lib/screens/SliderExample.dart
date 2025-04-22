import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/SliderProvider.dart';

class SliderExample extends StatefulWidget{
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
  
}
 class _SliderExampleState extends State<SliderExample> { 
  double value = 1.0;
  
  @override
   Widget build(BuildContext context){
    final provider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example"),
      ),
      body: Column(
        children: [
          Consumer<SliderProvider>(
              builder: (context,value, child) {
            return
                Slider(
                    min: 0,
                    max: 1,
                    value: value.value,
                    onChanged: (val){
                      value.setValue(val);
                    });

          }),

          Consumer<SliderProvider>(
              builder: (context,value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(value.value),
                        ),
                        child: Text("Container 1", style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value),
                        ),
                        child: Text("Container 2", style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    )
                  ],
                );
              }),

        ],
      ),
    );
    
  }
 }

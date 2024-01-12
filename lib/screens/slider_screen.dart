import 'package:flutter/material.dart';
import 'package:practice_provider/providers/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  SlidernState createState() => SlidernState();
}

class SlidernState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Slider(
                  label: "Slide to see Opacity",
                  min: 0,
                  max: 1,
                  value: value.opacity,
                  onChanged: (val) {
                    value.setOpacity(val);
                  });
            }),
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.opacity),
                      child: const Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.yellow.withOpacity(value.opacity),
                      child: const Center(child: Text('Container 2')),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

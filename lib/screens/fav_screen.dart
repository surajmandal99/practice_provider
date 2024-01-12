import 'package:flutter/material.dart';
import 'package:practice_provider/providers/fav_provider.dart';

import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fav Items"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Expanded(
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: provider.favList.length,
                      itemBuilder: (context, index) {
                        return Card(child:
                            Consumer(builder: (context, favProvider, child) {
                          return ListTile(
                            title: Text('item${provider.isFav(index)}'),
                            trailing: const Icon(Icons.favorite),
                          );
                        }));
                      }))
            ])));
  }
}

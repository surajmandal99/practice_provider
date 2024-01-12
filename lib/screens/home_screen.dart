import 'package:flutter/material.dart';
import 'package:practice_provider/providers/fav_provider.dart';
import 'package:practice_provider/screens/fav_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const FavScreen())));
                },
                icon: const Icon(Icons.favorite_border_outlined)),
          ],
          title: const Text("Items List"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Expanded(
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return Card(child: Consumer(
                            builder: (context, FavProvider favProvider, child) {
                          return ListTile(
                            title: Text("Item $index"),
                            trailing: IconButton(
                                onPressed: () {
                                  if (favProvider.isFav(index)) {
                                    favProvider.removeFav(index);
                                  } else {
                                    favProvider.addFav(index);
                                  }
                                },
                                icon: favProvider.isFav(index)
                                    ? const Icon(Icons.favorite)
                                    : const Icon(
                                        Icons.favorite_border_outlined)),
                          );
                        }));
                      }))
            ])));
  }
}

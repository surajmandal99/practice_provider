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
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return Card(child: Consumer<FavProvider>(
                          builder: (context, value, child) {
                            return ListTile(
                              onTap: () {
                                if (value.favList.contains(index)) {
                                  value.removeFav(index);
                                } else {
                                  value.addFav(index);
                                }
                              },
                              title: Text("Item $index"),
                              trailing: Icon(value.favList.contains(index)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined),
                            );
                          },
                        ));
                      }))
            ],
          ),
        ));
  }
}

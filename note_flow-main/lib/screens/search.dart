import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../helper/functionMethodClass.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: TextField(
            cursorColor: const Color.fromARGB(255, 255, 255, 255),
            style: const TextStyle(color: Color.fromARGB(255, 223, 223, 223)),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 36, 36, 36),
              hintText: 'Search...',
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 146, 146, 146)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              prefixIcon: const Icon(
                Iconsax.search_normal,
                color: Color.fromARGB(255, 158, 158, 158),
                size: 22,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "History",
                        style: TextStyle(
                            color: Color.fromARGB(255, 119, 119, 119),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  customListTiles.length,
                  (index) {
                    final tile = customListTiles[index];
                    return Card(
                      color: const Color.fromARGB(255, 40, 40, 40),
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 5),
                            Icon(
                              tile.icon,
                              color: const Color.fromARGB(255, 119, 119, 119),
                            ),
                          ],
                        ),
                        title: Text(
                          tile.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

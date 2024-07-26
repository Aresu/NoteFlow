import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/notification.dart';
import '../screens/note.dart';

class TabNavigation extends StatelessWidget {
  final String email;

  const TabNavigation({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Home_Screen(email: email),
              const Search_Screen(),
              const Notification_Screen(),
              const Note_Screen(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            unselectedLabelColor: Color.fromARGB(255, 123, 123, 123),
            labelColor: Color.fromARGB(255, 61, 61, 61),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 2.0, color: Color.fromARGB(255, 61, 61, 61)),
              insets: EdgeInsets.symmetric(horizontal: 40),
            ),
            tabs: [
              Tab(
                icon: Icon(Iconsax.home),
              ),
              Tab(
                icon: Icon(Iconsax.search_normal),
              ),
              Tab(
                icon: Icon(Iconsax.notification),
              ),
              Tab(
                icon: Icon(Iconsax.edit),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 249, 249, 247),
        ),
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Daily Notes",
    icon: Iconsax.document,
  ),
  ProfileCompletionCard(
    title: "Task List",
    icon: Iconsax.tag_right,
  ),
  ProfileCompletionCard(
    title: "Untitled",
    icon: Iconsax.document_sketch,
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  final List<String> subNotes;

  CustomListTile({
    required this.icon,
    required this.title,
    required this.subNotes,
  });
}


List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Iconsax.document,
    title: "Daily Notes",
    subNotes: ["Note 1", "Note 2", "Note 3"],
  ),
  CustomListTile(
    icon: Iconsax.note,
    title: "Quick Note",
    subNotes: ["Note 4", "Note 5"],
  ),
  CustomListTile(
    icon: Iconsax.tag_right,
    title: "Task List",
    subNotes: ["Task 1", "Task 2"],
  ),
  CustomListTile(
    icon: Iconsax.document_sketch,
    title: "Untitled",
    subNotes: ["Untitled Note 1", "Untitled Note 2"],
  ),
];


class AppBarText1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarText1({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: IconButton(
              onPressed: () {
                // function here
              },
              icon: const Icon(
                Iconsax.close_circle,
                color: Color.fromARGB(255, 32, 32, 32),
              ),
            ))
      ],
    );
  }
}

class AppBarText2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarText2({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      actions: [
        IconButton(
          icon: const Icon(
            Iconsax.document_upload,
            color: Color.fromARGB(255, 32, 32, 32),
          ),
          onPressed: () {
            // Add your share action here
          },
        ),
        IconButton(
          icon: const Icon(
            Iconsax.more,
            color: Color.fromARGB(255, 32, 32, 32),
          ),
          onPressed: () {
            // Add your more options action here
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            onPressed: () {
              // Add your done action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 241, 241, 239),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            child: const Text(
              'Done',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ],
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 255, 255, 255)),
          strokeWidth: 10,
        ),
      ),
    );
  }
}

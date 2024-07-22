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
            unselectedLabelColor: Color.fromARGB(255, 132, 132, 132),
            labelColor: Color.fromARGB(255, 194, 194, 194),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 2.0, color: Color.fromARGB(255, 194, 194, 194)),
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
          backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        ),
      ),
    );
  }
}

class ContinueDialog extends StatelessWidget {
  final String message;

  const ContinueDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Profile"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField("Username", "Enter your username"),
          _buildTextField("First Name", "Enter your first name"),
          _buildTextField("Last Name", "Enter your last name"),
          _buildTextField("Address", "Enter your address"),
          _buildTextField("Email", "Enter your email"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          child: const Text("Continue"),
        ),
      ],
    );
  }

  Widget _buildTextField(String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UploadDialog extends StatelessWidget {
  final String message;

  const UploadDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Photos"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          child: const Text("Upload"),
        ),
      ],
    );
  }
}

class AddDialog extends StatelessWidget {
  final String message;

  const AddDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Skills"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          child: const Text("Add"),
        ),
      ],
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
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Iconsax.document,
    title: "Daily Notes",
  ),
  CustomListTile(
    icon: Iconsax.note,
    title: "Quick Note",
  ),
  CustomListTile(
    icon: Iconsax.tag_right,
    title: "Task List",
  ),
  CustomListTile(
    icon: Iconsax.document_sketch,
    title: "Untitled",
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
      foregroundColor: Colors.black,
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: IconButton(
              onPressed: () {
                // function here
              },
              icon: const Icon(
                Iconsax.close_circle,
                color: Color.fromARGB(255, 223, 223, 223),
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
      foregroundColor: Colors.black,
      actions: [
        IconButton(
          icon: const Icon(
            Iconsax.document_upload,
            color: Color.fromARGB(255, 223, 223, 223),
          ),
          onPressed: () {
            // Add your share action here
          },
        ),
        IconButton(
          icon: const Icon(
            Iconsax.more,
            color: Color.fromARGB(255, 223, 223, 223),
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
              backgroundColor: const Color.fromARGB(255, 55, 55, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.white),
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
          valueColor: AlwaysStoppedAnimation(Colors.black),
          strokeWidth: 10,
        ),
      ),
    );
  }
}

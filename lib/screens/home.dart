import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../helper/functionMethodClass.dart';

class Home_Screen extends StatefulWidget {
  final String email;

  Home_Screen({Key? key, required this.email}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = List.filled(customListTiles.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  color: const Color.fromARGB(255, 55, 55, 55),
                  child: const Icon(Iconsax.user,
                  color: Color.fromARGB(255, 146, 146, 146)),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "NoteFlow",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 223, 223, 223),
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.email,
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 104, 104, 104)),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: PopupMenuButton<String>(
                  color: const Color.fromARGB(255, 40, 40, 40),
                  icon: const Icon(Iconsax.more_circle, color: Colors.white),
                  offset: const Offset(-40, 0),
                  onSelected: (value) {
                    // Handle menu item selection
                    if (value == 'edit') {
                      // Edit action
                    } else if (value == 'delete') {
                      // Delete action
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'members',
                      child: ListTile(
                        leading: Icon(
                          Iconsax.people,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                        title: Text(
                          "Members",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'settings',
                      child: ListTile(
                        leading: Icon(
                          Iconsax.setting,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'trash',
                      child: ListTile(
                        leading: Icon(
                          Iconsax.trash,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                        title: Text(
                          "Trash",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'help',
                      child: ListTile(
                        leading: Icon(
                          Iconsax.message_question,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                        title: Text(
                          "Help",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Recent Notes",
                  style: TextStyle(
                      color: Color.fromARGB(255, 119, 119, 119), fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 70, 70, 70), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 49, 49, 49),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Icon(
                                    card.icon,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 37, 37, 37),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    card.title,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Notes List",
                  style: TextStyle(
                      color: Color.fromARGB(255, 119, 119, 119), fontSize: 12),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your onPressed logic for Iconsax.refresh here
                    },
                    child: const Icon(
                      Iconsax.refresh,
                      color: Color.fromARGB(255, 119, 119, 119),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: const Icon(
                      Iconsax.add,
                      color: Color.fromARGB(255, 119, 119, 119),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: customListTiles.length,
            itemBuilder: (context, index) {
              final tile = customListTiles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  color: const Color.fromARGB(255, 50, 50, 50),
                  child: ExpansionPanelList(
                    elevation: 0,
                    expandedHeaderPadding: EdgeInsets.zero,
                    expansionCallback: (panelIndex, isExpanded) {
                      setState(() {
                        _isExpanded[index] = !_isExpanded[index];
                      });
                    },
                    children: [
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 5),
                                Icon(
                                  tile.icon,
                                  color:
                                      const Color.fromARGB(255, 119, 119, 119),
                                ),
                              ],
                            ),
                            title: Text(
                              tile.title,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tile.subNotes.length,
                            itemBuilder: (context, subIndex) {
                              return ListTile(
                                leading: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Color.fromARGB(
                                          255, 119, 119, 119),
                                    ),
                                  ],
                                ),
                                tileColor:
                                    const Color.fromARGB(255, 32, 32, 32),
                                title: Text(
                                  tile.subNotes[subIndex],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: PopupMenuButton<String>(
                                  color: const Color.fromARGB(255, 40, 40, 40),
                                  offset: const Offset(-40, 0),
                                  icon: const Icon(Icons.more_vert,
                                      color: Colors.white),
                                  onSelected: (value) {
                                    // Handle menu item selection
                                    if (value == 'edit') {
                                      // Edit action
                                    } else if (value == 'delete') {
                                      // Delete action
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(
                                      value: 'rename',
                                      child: ListTile(
                                        leading: Icon(
                                          Iconsax.message,
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                        ),
                                        title: Text(
                                          "Rename",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: ListTile(
                                        leading: Icon(
                                          Iconsax.edit,
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                        ),
                                        title: Text(
                                          "Edit",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: ListTile(
                                        leading: Icon(
                                          Iconsax.trash,
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                        ),
                                        title: Text(
                                          "Trash",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        isExpanded: _isExpanded[index],
                        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
    );
  }
}

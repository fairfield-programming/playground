import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'dart:io' show Platform;

void main() {
  developer.log('Starting Up');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<MenuItem> menuItems = [
      MenuItem(
        label: "My Classes",
        icon: Icons.auto_stories_rounded,
      ),
      MenuItem(
        label: "Class Browser",
        icon: Icons.collections_bookmark_rounded,
      ),
      MenuItem(
        label: "Hall of Fame",
        icon: Icons.workspace_premium_rounded,
      ),
      MenuItem(
        label: "Join a Room",
        icon: Icons.meeting_room_rounded,
      ),
    ];

    return MediaQuery(
      data: const MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: const <Widget>[
            Expanded(
              flex: 2,
              child: Sidebar(menuItems: menuItems),
            ),
            Expanded(
              flex: 6,
              child: Text(
                "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.menuItems});

  final List<MenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SidebarHead(),
          ...menuItems.map((e) => SidebarButton(label: e.label, icon: e.icon))
        ],
      ),
    );
  }
}

class SidebarHead extends StatelessWidget {
  const SidebarHead({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => developer.log('The button was clicked'),
      child: Container(
        color: Colors.white,
        height: 60.0,
        child: Row(children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20), // Image radius
                  child: Image.network(
                    'https://avatars.dicebear.com/api/bottts/william%20mcgonagle.png?b=%23f5f5f5&scale=80',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                "William McGonagle",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
              ),
              Text(
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                "★ 194",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class SidebarButton extends StatefulWidget {
  const SidebarButton({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  State<SidebarButton> createState() =>
      SidebarButtonState(label: label, icon: icon);
}

class SidebarButtonState extends State<SidebarButton> {
  SidebarButtonState({required this.label, required this.icon});

  final String label;
  final IconData icon;

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (a) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (a) {
          setState(() {
            isHovering = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isHovering ? Colors.grey[100] : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          height: 40.0,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  icon,
                  size: 22,
                  color: Colors.grey[900],
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GoribDrawer extends StatelessWidget {
  const GoribDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFe2e2e2),
            ),
            child: Image.asset(
              "assets/logo.png",
              width: double.infinity,
            ),
          ),
          ListTile(
            title: Text("হোম"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            title: Text("ডাউনলোড"),
            onTap: () {
              Navigator.of(context).pushNamed("/download");
            },
          ),
          ListTile(
            title: Text("বিস্তারিত"),
            onTap: () {
              Navigator.of(context).pushNamed("/about");
            },
          ),
        ],
      ),
    );
  }
}

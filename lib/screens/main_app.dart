import 'package:chat/constants.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/listfriend/listfriend_screen.dart';
import 'package:chat/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ChatsScreen(),
          ListFriendScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryColor,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        items: [
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.solidMessage, size: 20),
            title: Text('Tin nhắn'),
          ),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.userGroup, size: 20),
            title: Text('Bạn bè'),
          ),
          SalomonBottomBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            title: Text('Cá nhân'),
          ),
        ],
      ),
    );
  }
}

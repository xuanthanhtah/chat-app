import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Chat.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var checked = 0;
  final tag = <String>[
    "Tin nhắn gần đây",
    "Đang hoạt động",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tag.length,
            itemBuilder: (context, index) => Column(
              children: [
                FillOutlineButton(
                  press: () {
                    setState(() {
                      checked = index;
                    });
                  },
                  text: tag[index],
                  isFilled: checked == index,
                ),
              ],
            ),
          ),

          // Row(
          //   children: [

          //     FillOutlineButton(
          //         press: () {}, text: "Tin nhắn gần đây", isFilled: false),
          //     SizedBox(width: kDefaultPadding),
          //     FillOutlineButton(
          //       press: () {},
          //       text: "Đang hoạt động",
          //       isFilled: true,
          //     ),
          //   ],
          // ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wechat_desktop/main/main_chat_content_page.dart';
import 'package:flutter_wechat_desktop/main/main_chat_left_page.dart';
import 'package:flutter_wechat_desktop/widget/resize_widget.dart';

/// @author jd

class MainChatPage extends StatefulWidget {
  @override
  _MainChatPageState createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  Map currentShowMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          ResizeWidget(
            width: 250,
            minWidth: 200,
            maxWidth: 500,
            rightBorder: VerticalDivider(
              width: 1,
            ),
            child: MainChatLeftPage(
              onView: (Map item) {
                setState(() {
                  currentShowMessage = item;
                });
              },
            ),
          ),
          Expanded(
            child: MainChatContentPage(
              message: currentShowMessage,
            ),
          ),
        ],
      ),
    );
  }
}

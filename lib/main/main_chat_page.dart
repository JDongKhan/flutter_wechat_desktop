import 'package:flutter/material.dart';
import 'package:flutter_wechat_desktop/main/main_chat_content_page.dart';
import 'package:flutter_wechat_desktop/main/main_chat_group_content_page.dart';
import 'package:flutter_wechat_desktop/main/main_chat_left_page.dart';
import 'package:flutter_wechat_desktop/widget/resize_widget.dart';

/// @author jd

class MainChatPage extends StatefulWidget {
  @override
  _MainChatPageState createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  Map? _currentShowMessage;

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
                  _currentShowMessage = item;
                });
              },
            ),
          ),
          Expanded(
            child: _buildContentPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildContentPage() {
    if (_currentShowMessage == null) {
      return Container();
    }
    bool group = _currentShowMessage!["group"] ?? false;
    if (group) {
      return MainChatGroupContentPage(
        message: _currentShowMessage,
      );
    }
    return MainChatContentPage(
      message: _currentShowMessage,
    );
  }
}

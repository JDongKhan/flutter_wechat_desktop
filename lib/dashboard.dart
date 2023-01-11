import 'package:flutter/material.dart';
import 'package:flutter_wechat_desktop/organization/organization_page.dart';

import 'left/left_menu_page.dart';
import 'main/main_chat_page.dart';
import 'web/web_page.dart';

/// @author jd

class DashboardPage extends StatefulWidget {
  DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<String, WidgetBuilder> map = {
    'chat': (BuildContext context) => MainChatPage(),
    'organization': (BuildContext context) => OrganizationPage(),
    'web': (BuildContext context) => WebPage(),
  };

  Widget mainWidget = MainChatPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LeftMenuPage(
            onItemChanged: (String tag) {
              setState(() {
                mainWidget = map[tag]!.call(context);
              });
            },
          ),
          Expanded(child: mainWidget),
        ],
      ),
    );
  }
}

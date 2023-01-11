import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @author jd
class MainChatLeftPage extends StatefulWidget {
  const MainChatLeftPage({this.onView});
  final ValueChanged<Map>? onView;
  @override
  _MainChatLeftPageState createState() => _MainChatLeftPageState();
}

class _MainChatLeftPageState extends State<MainChatLeftPage> {
  ///选中的行
  int _selectedIndex = 0;

  /// 消息列表
  List messageList = [];

  @override
  void initState() {
    rootBundle.loadString('assets/jsons/message_list.json').then((value) {
      setState(() {
        messageList = jsonDecode(value);
        widget.onView?.call(messageList.first);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          _searchWidget(),
          _topMenuWidget(),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: _messageListWidget(),
          ),
        ],
      ),
    );
  }

  /// 查询框
  Widget _searchWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: CupertinoSearchTextField(),
    );
  }

  /// 顶部菜单
  Widget _topMenuWidget() {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.messenger_outline,
              color: Colors.grey,
              size: 16,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.center_focus_strong_outlined,
              color: Colors.grey,
              size: 16,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 16,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.collections_bookmark_outlined,
              color: Colors.grey,
              size: 16,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.tv_off_outlined,
              color: Colors.grey,
              size: 16,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  ///消息列表
  Widget _messageListWidget() {
    return ListView.builder(
      itemBuilder: (c, idx) {
        Map item = messageList[idx];
        return ListTile(
          tileColor: Colors.white,
          selected: _selectedIndex == idx,
          selectedTileColor: Colors.grey.withAlpha(20),
          onTap: () {
            _selectedIndex = idx;
            widget.onView?.call(item);
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              item['image'],
              width: 40,
              height: 40,
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  item['title'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Text(
                item['time'],
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
          subtitle: Text(
            item['subTitle'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        );
      },
      itemCount: messageList.length,
    );
  }
}

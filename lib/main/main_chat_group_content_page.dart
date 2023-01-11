import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat_desktop/widget/resize_widget.dart';

/// @author jd

///群组聊天
class MainChatGroupContentPage extends StatefulWidget {
  const MainChatGroupContentPage({this.message});
  final Map? message;
  @override
  _MainChatGroupContentPageState createState() =>
      _MainChatGroupContentPageState();
}

class _MainChatGroupContentPageState extends State<MainChatGroupContentPage> {
  TextEditingController _messageController = TextEditingController();

  final Color _diverColor = const Color(0xFFE0E0E0);

  //隐藏公告
  bool _hiddenNotice = false;

  //显示右边的箭头
  bool _showRightArrow = false;

  //显示右侧信息区域
  bool _showRightInfo = true;

  ///消息内容列表
  List messageList = [];

  @override
  void initState() {
    rootBundle
        .loadString('assets/jsons/message_content_list.json')
        .then((value) {
      setState(() {
        messageList = jsonDecode(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.message == null) {
      return Container();
    }
    return Container(
      child: Column(
        children: [
          _userInfoWidget(),
          _topMenuWidget(),
          Divider(
            height: 1,
            color: _diverColor,
          ),
          Expanded(
            child: Container(
              color: Colors.grey.withAlpha(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: _messageListWidget(),
                        ),
                        ResizeWidget(
                          height: 200,
                          minHeight: 150,
                          maxHeight: 500,
                          child: _bottomInputWidget(),
                          topBorder: Divider(
                            height: 1,
                            color: _diverColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  _buildRightDivider(),
                  if (_showRightInfo)
                    SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          _buildNoticeWidget(),
                          Expanded(
                            child: _buildUserListWidget(),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 对方信息
  Widget _userInfoWidget() {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Text(
          widget.message!['title'],
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(
            Icons.tv,
            color: Colors.grey,
            size: 13,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  /// 设置菜单
  Widget _topMenuWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            Icons.phone,
            color: Colors.grey,
            size: 16,
          ),
          onPressed: () {},
        ),
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
            Icons.people_alt_outlined,
            color: Colors.grey,
            size: 16,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.addchart_rounded,
            color: Colors.grey,
            size: 16,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.grey,
            size: 16,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 16,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  ///消息列表
  Widget _messageListWidget() {
    return Container(
      child: ListView.builder(
        itemBuilder: (c, idx) {
          Map item = messageList[idx];
          String image = 'assets/images/user_head_0.png';
          bool from = item['from'] == '0';
          if (from) {
            image = widget.message!['image'];
          }
          if (from) {
            return ListTile(
              minVerticalPadding: 20,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                ),
              ),
              title: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Text(item['title']),
                ),
              ),
            );
          }
          return ListTile(
            minVerticalPadding: 20,
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: 40,
                height: 40,
              ),
            ),
            title: Container(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.greenAccent,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Text(item['title']),
              ),
            ),
          );
        },
        itemCount: messageList.length,
      ),
    );
  }

  Widget _bottomInputWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _inputMenuWidget(),
        _inputWidget(),
        _sendWidget(),
      ],
    );
  }

  ///输入框菜单
  Widget _inputMenuWidget() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.translate,
            size: 14,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.face_outlined,
            size: 14,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.image,
            size: 14,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.file_copy_outlined,
            size: 14,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.screen_share_outlined,
            size: 14,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.settings_applications_outlined,
            size: 14,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  ///输入框
  Widget _inputWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: _messageController,
          maxLength: 10000,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  ///发送组件
  Widget _sendWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          child: Text(
            '关闭(C)',
            style: TextStyle(color: Colors.black.withAlpha(150)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          child: Text(
            '发送(S)',
            style: TextStyle(color: Colors.black.withAlpha(150)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  ///公告
  Widget _buildNoticeWidget() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_hiddenNotice)
            Text(
              '公告:进入本群请仔细查看本公告\n 1、不允许发广告 \n 2、不可以勾搭小姐姐',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          InkWell(
            onTap: () {
              setState(() {
                _hiddenNotice = !_hiddenNotice;
              });
            },
            child: Icon(
              _hiddenNotice
                  ? Icons.arrow_drop_down_outlined
                  : Icons.arrow_drop_up_outlined,
              color: Colors.grey[400],
            ),
          ),
          if (!_hiddenNotice)
            Divider(
              height: 1,
              thickness: 1,
              color: _diverColor,
            ),
        ],
      ),
    );
  }

  Widget _buildUserListWidget() {
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 0, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('群成员[100]'),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (c, index) {
                return Container(
                  child: Row(
                    children: [
                      Text(
                        '成员$index',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightDivider() {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) {
        _showRightArrow = true;
        setState(() {});
      },
      onExit: (PointerExitEvent event) {
        _showRightArrow = false;
        setState(() {});
      },
      child: SizedBox(
        width: 10,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            if (_showRightInfo)
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: _diverColor,
              ),
            if (_showRightArrow)
              InkWell(
                onTap: () {
                  setState(() {
                    _showRightInfo = !_showRightInfo;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 1),
                  color: Colors.grey[200],
                  padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                  child: Icon(
                    _showRightInfo
                        ? Icons.arrow_right_outlined
                        : Icons.arrow_left_outlined,
                    color: Colors.grey[400],
                    size: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

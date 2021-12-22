import 'package:flutter/material.dart';

/// @author jd

class LeftMenuPage extends StatefulWidget {
  const LeftMenuPage({this.onItemChanged});
  final ValueChanged<String> onItemChanged;
  @override
  _LeftMenuPageState createState() => _LeftMenuPageState();
}

class _LeftMenuPageState extends State<LeftMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 80,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          _userHeadWidget(),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '王金东',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(
            height: 30,
          ),
          IconButton(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            onPressed: () {
              widget.onItemChanged('chat');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
            icon: Icon(
              Icons.phone_android_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              widget.onItemChanged('organization');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
            icon: Icon(
              Icons.menu_book_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              widget.onItemChanged('web');
            },
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.hd,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.messenger_outline,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star_border_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 顶部菜单
  Widget _topMenuWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.close,
          size: 12,
          color: Colors.greenAccent,
        ),
        Icon(
          Icons.menu,
          size: 12,
          color: Colors.greenAccent,
        ),
        Icon(
          Icons.more_horiz,
          size: 12,
          color: Colors.greenAccent,
        ),
      ],
    );
  }

  /// 用户头像
  Widget _userHeadWidget() {
    return Container(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            'assets/images/user_head_0.png',
            fit: BoxFit.contain,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

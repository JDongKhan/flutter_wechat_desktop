import 'package:flutter/material.dart';

/// @author jd
class OrganizationPage extends StatefulWidget {
  @override
  _OrganizationPageState createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  final List menus = [
    {
      'icon': Icons.open_with_rounded,
      'title': '组织架构',
    },
    {
      'icon': Icons.design_services,
      'title': '虚拟团队',
    },
    {
      'icon': Icons.cleaning_services,
      'title': '服务号',
    },
    {
      'icon': Icons.phone_bluetooth_speaker,
      'title': '客服',
    },
    {
      'icon': Icons.chat,
      'title': '群聊',
    },
    {
      'icon': Icons.find_in_page_outlined,
      'title': '找企业',
    },
    {
      'icon': Icons.people_alt_outlined,
      'title': '联系人',
    },
    {
      'icon': Icons.emoji_people,
      'title': '个人好友',
    },
    {
      'icon': Icons.recent_actors,
      'title': '最近会话',
    },
    {
      'icon': Icons.favorite_outline,
      'title': '特别关注',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 200,
            child: ListView.builder(
              itemBuilder: (c, idx) {
                Map item = menus[idx];
                return ListTile(
                  // dense: true,
                  minLeadingWidth: 10,
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.only(left: 30),
                  leading: Icon(
                    item['icon'] as IconData,
                    color: Colors.black,
                    size: 16,
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(
                        color: Colors.black.withAlpha(200), fontSize: 14),
                  ),
                );
              },
              itemCount: menus.length,
            ),
          ),
          const VerticalDivider(
            width: 1,
          ),
          Container(
            color: Colors.grey.withAlpha(10),
          )
        ],
      ),
    );
  }
}

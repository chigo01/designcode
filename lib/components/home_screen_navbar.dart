import 'package:flutter/material.dart';
import 'package:untitled/components/searchfield_widget.dart';

import 'package:untitled/components/sidebar_button.dart';class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SideBarButton(),
          SearchFieldWidget(),
          Icon(Icons.notifications),
          SizedBox(
            width: 16.0,
          ),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}

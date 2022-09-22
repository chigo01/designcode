import 'package:flutter/material.dart';
import 'package:untitled/components/searchfield_widget.dart';

import 'package:untitled/components/sidebar_button.dart';
import 'package:untitled/screens/profile_screen.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({Key? key, required this.triggerAnimation})
      : super(key: key);
  final Function() triggerAnimation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarButton(
            triggerAnimation: triggerAnimation,
          ),
          const SearchFieldWidget(),
          const Icon(Icons.notifications),
          const SizedBox(
            width: 16.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('asset/images/profile.jpg'),
            ),
          )
        ],
      ),
    );
  }
}

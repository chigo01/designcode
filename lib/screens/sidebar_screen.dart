import 'package:flutter/material.dart';

import '../components/sidebar_row.dart';
import '../constants.dart';
import '../model/sidebar.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(30.0),
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 31.0,
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John Doe', style: kHeadlineLabelStyle),
                    const SizedBox(height: 4),
                    Text('License ends on 21 jan, 2021', style: kSubtitleStyle),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SidebarRow(
              item: sideBarItems[0],
            ),
            const SizedBox(height: 32),
            SidebarRow(
              item: sideBarItems[1],
            ),
            const SizedBox(height: 32),
            SidebarRow(
              item: sideBarItems[2],
            ),
            const SizedBox(height: 32),
            SidebarRow(
              item: sideBarItems[3],
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  'asset/icons/icon-logout.png',
                  width: 17,
                ),
                const SizedBox(width: 12),
                Text(
                  'Log Out',
                  style: kSecondaryCalloutLabelStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

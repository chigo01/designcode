import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled/components/lists/certificate_viewer.dart';
import 'package:untitled/components/lists/completed_courses_lists.dart';

import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final List<String> badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: kCardPopupBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                ),
                boxShadow: [
                  BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0, 12),
                      blurRadius: 32),
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 32, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              maxWidth: 40,
                              maxHeight: 24,
                            ),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Profile",
                            style: kCalloutLabelStyle,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 32),
                              ],
                            ),
                            child: Icon(
                                Platform.isAndroid
                                    ? Icons.settings
                                    : CupertinoIcons.settings_solid,
                                color: kSecondaryLabelColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 84,
                            width: 84,
                            decoration: BoxDecoration(
                                gradient: const RadialGradient(
                                  colors: [
                                    Color(0xFF00AEFF),
                                    Color(0xFF0076FF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(42)),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(42),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('asset/images/profile.jpg'),
                                  radius: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sai Kambampati',
                                style: kTitle2Style,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Flutter Developer',
                                style: kSecondaryCalloutLabelStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bagdes',
                                  style: kHeadlineLabelStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'See all',
                                      style: kSearchPlaceholderStyle,
                                    ),
                                    const Icon(Icons.chevron_right,
                                        color: kSecondaryLabelColor)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 112,
                      child: ListView.builder(
                        itemCount: badges.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 20, right: index != 3 ? 0 : 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: kShadowColor.withOpacity(0.1),
                                    offset: const Offset(0, 12),
                                    blurRadius: 18),
                              ],
                            ),
                            child: Image.asset('asset/badges/${badges[index]}'),
                          );
                        },
                        padding: const EdgeInsets.only(
                          bottom: 28,
                        ),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, left: 20, right: 20, bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Certificates', style: kHeadlineLabelStyle),
                      Row(
                        children: [
                          Text(
                            'See all ',
                            style: kSearchPlaceholderStyle,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kSecondaryLabelColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CertificateViewer(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Completed courses', style: kHeadlineLabelStyle),
                      Row(
                        children: [
                          Text(
                            'See all ',
                            style: kSearchPlaceholderStyle,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kSecondaryLabelColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CompletedCoursesList( ),
            const SizedBox(height: 28,)
          ],
        ),
      ),
    );
  }
}

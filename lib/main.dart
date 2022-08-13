import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/model/course.dart';

import 'components/home_screen_navbar.dart';
import 'components/lists/recent_course_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                const HomeScreenNavBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Recents',
                        style: kLargeTitleStyle,
                      ),
                      Text('23 courses, more coming', style: kSubtitleStyle),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const RecentCourseList(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 25,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Explore',
                        style: kTitle1Style,
                      ),
                    ],
                  ),
                ),
                ExploreCourseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(left: index ==0 ?20.0: 0.0),
            child: ExploreCourseCard(course: exploreCourses[index]),
          );
        },
      ),
    );
  }
}

class ExploreCourseCard extends StatelessWidget {
  const ExploreCourseCard({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41),
        child: Container(
          height: 120,
          width: 280,
          decoration: BoxDecoration(gradient: course.background),
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.courseSubtitle,
                          style: kCardSubtitleStyle,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          course.courseTitle,
                          style: kCardTitleStyle,
                        ),
                      ]),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

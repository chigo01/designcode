import 'package:flutter/material.dart';

import '../../model/course.dart';
import '../cards/explore-course_card.dart';
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
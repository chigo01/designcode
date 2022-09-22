import 'package:flutter/material.dart';
import 'package:untitled/components/cards/course_sections_card.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/model/course.dart';

class CourseSectionList extends StatelessWidget {
  const CourseSectionList({Key? key}) : super(key: key);
  List<Widget> courseSectionWidgets() {
    List<Widget> cards = [];
    for (var course in courseSections) {
      cards.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CourseSectionCard(
            course: course,
          ),
        ),
      );
    }
    cards.add(
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          'No more section to view, look\nfor more in our courses',
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: courseSectionWidgets(),
      ),
    );
  }
}


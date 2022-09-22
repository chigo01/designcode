import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/course.dart';

class CourseSectionCard extends StatelessWidget {
  const CourseSectionCard({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41),
          gradient: course.background,
          boxShadow: [
            BoxShadow(
              color: course.background.colors[0].withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
            BoxShadow(
              color: course.background.colors[1].withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41),
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                Row(
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
                          const SizedBox(height: 6),
                          Text(
                            course.courseSubtitle,
                            style: kCardTitleStyle,
                          ),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

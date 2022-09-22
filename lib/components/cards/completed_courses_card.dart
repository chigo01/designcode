import 'package:flutter/material.dart';


import 'package:untitled/constants.dart';
import 'package:untitled/model/course.dart';

class CompletedWatchingCard extends StatelessWidget {
  const CompletedWatchingCard({Key? key, required this.course})
      : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: course.background.colors[0].withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41.0),
                child: SizedBox(
                  height: 140,
                  width: 260,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'asset/illustrations/${course.illustration}',
                                fit: BoxFit.cover,
                                height: 140,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 230, bottom: 12), //changed here
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0, 4),
                      blurRadius: 16.0,
                    )
                  ]),
              padding: const EdgeInsets.only(
                top: 12.5,
                bottom: 13.5,
                left: 20.5,
                right: 14.5,
              ),
              child: Image.asset('asset/icons/icon-play.png'),
            ),
          ),
        ],
      ),
    );
  }
}

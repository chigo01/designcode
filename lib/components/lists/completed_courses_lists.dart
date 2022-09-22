import 'package:flutter/widgets.dart';
import 'package:untitled/components/cards/completed_courses_card.dart';
import 'package:untitled/components/cards/continue_watching_card.dart';
import 'package:untitled/model/course.dart';

class CompletedCoursesList extends StatefulWidget {
  const CompletedCoursesList({Key? key}) : super(key: key);

  @override
  State<CompletedCoursesList> createState() => _CompletedCoursesListState();
}

class _CompletedCoursesListState extends State<CompletedCoursesList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: completedCourses.map((course) {
        var index = completedCourses.indexOf(course);
        return Container(
          width: 7,
          height: 7,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index
                  ? const Color(0xFF0971EF)
                  : const Color(0xFFA6AEBD)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            itemCount: completedCourses.length,
            itemBuilder: ((context, index) {
              return Opacity(
                opacity: currentPage == index ? 1 : 0.5,
                child: CompletedWatchingCard(course: completedCourses[index])
              );
            }),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.74),
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}

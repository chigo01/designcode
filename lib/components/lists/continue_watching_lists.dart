import 'package:flutter/widgets.dart';
import 'package:untitled/components/cards/continue_watching_card.dart';
import 'package:untitled/model/course.dart';

class ContinueWatchingList extends StatefulWidget {
  const ContinueWatchingList({Key? key}) : super(key: key);

  @override
  State<ContinueWatchingList> createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingCourses.map((Course) {
        var index = continueWatchingCourses.indexOf(Course);
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
            itemCount: continueWatchingCourses.length,
            itemBuilder: ((context, index) {
              return ContinueWatchingCard(
                course: continueWatchingCourses[index],
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

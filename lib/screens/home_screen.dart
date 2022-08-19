import 'package:flutter/material.dart';
import 'package:untitled/screens/sidebar_screen.dart';

import '../components/home_screen_navbar.dart';
import '../components/lists/explore_course_list.dart';
import '../components/lists/recent_course_list.dart';
import '../constants.dart';
class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget>
    with TickerProviderStateMixin {
  Animation<Offset>? sidebarAnimation;
  Animation<double>? fadeAnimation;
  AnimationController? sidebarAnimationController;
  var sidebarHidden = true;
  @override
  initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController!, curve: Curves.easeInOut),);
    fadeAnimation = Tween<double>(
      begin:  0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController!, curve: Curves.easeInOut),);


  }
  @override
  void dispose(){
    super.dispose();
    sidebarAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  HomeScreenNavBar(
                    triggerAnimation: () {
                      setState((){
                        sidebarHidden = !sidebarHidden;
                      });
                      sidebarAnimationController?.forward();
                    },
                  ),
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
                  const ExploreCourseList(),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation!,
                    child: GestureDetector(
                      child: Container(
                        color: const Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      onTap: () {
                        setState((){
                          sidebarHidden = !sidebarHidden;
                        });
                        sidebarAnimationController?.reverse();} ,
                    ),
                  ),
                  SlideTransition(
                    position: sidebarAnimation!,
                    child: const SafeArea(
                      bottom: false,
                      child: SidebarScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

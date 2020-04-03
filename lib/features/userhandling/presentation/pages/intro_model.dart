import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'package:help_giver/features/userhandling/presentation/pages/login_page.dart';
import 'package:help_giver/features/userhandling/data/repositories/userhandling_repo.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Intro();
  }
}

class _Intro extends State<Intro> {
  // 1 Step: Create List of Slides
  List<Slide> slides = new List();

  // 2 Step: Create goToTab function
  Function goToTab;

  // 3 Step: Initialize Images
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        // title: "SCHOOL",
        // styleTitle: TextStyle(
        //     color: Color(0xff3da4ab),
        //     fontSize: 30.0,
        //     fontWeight: FontWeight.bold,
        //     ),
        // description:
        //     "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        // styleDescription: TextStyle(
        //     color: Color(0xfffe9c8f),
        //     fontSize: 20.0,
          
        //     ),
        pathImage: "images/introPG1.png",
      ),
    );
    slides.add(
      new Slide(
//         title: "MUSEUM",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             ),
//         description:
//             "Ye indulgence unreserved connection alteration appearance",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//  ),
        pathImage: "images/introPG2.png",
      ),
    );
    slides.add(
      new Slide(
      //   title: "COFFEE SHOP",
      //   styleTitle: TextStyle(
      //       color: Color(0xff3da4ab),
      //       fontSize: 30.0,
      //     ),
      //   description:
      //       "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
      //   styleDescription: TextStyle(
      //       color: Color(0xfffe9c8f),
      //       fontSize: 20.0,
      // ),
        pathImage: "images/introPG3.png",
      ),
    );
    slides.add(
      new Slide(
      //   title: "COFFEE SHOP",
      //   styleTitle: TextStyle(
      //       color: Color(0xff3da4ab),
      //       fontSize: 30.0,
      //     ),
      //   description:
      //       "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
      //   styleDescription: TextStyle(
      //       color: Color(0xfffe9c8f),
      //       fontSize: 20.0,
      // ),
        pathImage: "images/introPG4.png",
      ),
    );
  }

  // 4 Step: Create Other functions
  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xff1261A0),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xff1261A0),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xff1261A0),
    );
  }

  // 5 Step: Custom Tabs

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 300.0,
                height: 500.0,
                fit: BoxFit.contain,
              )),
              // Container(
              //   child: Text(
              //     currentSlide.title,
              //     style: currentSlide.styleTitle,
              //     textAlign: TextAlign.center,
              //   ),
              //   margin: EdgeInsets.only(top: 20.0),
              // ),
              // Container(
              //   child: Text(
              //     currentSlide.description,
              //     style: currentSlide.styleDescription,
              //     textAlign: TextAlign.center,
              //     maxLines: 5,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              //   margin: EdgeInsets.only(top: 20.0),
              // ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IntroSlider(
          // List slides
          slides: this.slides,

          // Skip button
          renderSkipBtn: this.renderSkipBtn(),
          colorSkipBtn: Color(0xffC7EA46),
          highlightColorSkipBtn: Color(0xffC7EA46),
onSkipPress:() => Navigator.of(context).pushNamed(LoginPage.routeName),
          // Next button
          renderNextBtn: this.renderNextBtn(),

          // Done button
          renderDoneBtn: this.renderDoneBtn(),
          onDonePress: () => Navigator.of(context).pushNamed(LoginPage.routeName),
          colorDoneBtn: Color(0xffC7EA46),
          highlightColorDoneBtn: Color(0xffC7EA46),

          // Dot indicator
          colorDot: Color(0xff1261A0),
          sizeDot: 13.0,

          // Tabs
          listCustomTabs: this.renderListCustomTabs(),
          backgroundColorAllSlides: Colors.white,
          refFuncGoToTab: (refFunc) {
            this.goToTab = refFunc;
          },

          // Show or hide status bar
          shouldHideStatusBar: true,

          // On tab change completed
          onTabChangeCompleted: this.onTabChangeCompleted,
        ),
      ),
    );
  }
}
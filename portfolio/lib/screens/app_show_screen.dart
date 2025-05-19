import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/app_show.dart';
import 'package:portfolio/widgets/buttons.dart';
import 'package:portfolio/widgets/texts.dart';

import '../apps/apps.dart';

class AppShowScreen extends StatefulWidget {
  final Apps app;
  const AppShowScreen({super.key, required this.app});

  @override
  _AppShowScreenState createState() => _AppShowScreenState();
}

class _AppShowScreenState extends State<AppShowScreen> {

  @override
  void initState() {
    super.initState();
    widget.app.initializeAppDetails();
    widget.app.initializeAppScreens();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWideScreen = size.width >= 1440;
    Size? phoneSize;

    if(size.width > 1920) {
      phoneSize = Size(518.4, 1118.4);
    } else if (size.width >= 1440) {
      phoneSize = Size(344, 745.6);
    } else if (size.width > 450) {
      double height = size.height*0.8;
      phoneSize = Size(height*0.4614, height);
    } else {
      phoneSize = Size(size.width*0.9, size.height*0.9);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: AppColors.royalMidnight,
          padding: EdgeInsets.symmetric(horizontal: size.width*0.03, vertical: size.height*0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //back button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(context: context),
                    SizedBox(width: 1)
                  ],
                ),

                SizedBox(height: size.height*0.03),

                isWideScreen
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      appCard(content: widget.app.appDetails, isWideScreen: isWideScreen),
                      DemoPhone(app: widget.app, size: size)
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DemoPhone(app: widget.app, size: size),
                      SizedBox(height: size.height*0.02),
                      appCard(content: widget.app.appDetails, isWideScreen: isWideScreen),
                    ],
                  )
              ],
            ),
          ),
        )
      ),
    );
  }
}

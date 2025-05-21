import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/app_show.dart';
import 'package:portfolio/widgets/buttons.dart';

import '../apps/apps.dart';

class AppShowScreen extends StatefulWidget {
  final Apps app;
  final Size phoneSize;
  const AppShowScreen({super.key, required this.app, required this.phoneSize});

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
    double cardWidth = isWideScreen ? size.width*0.5 : size.width*0.8;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appCard(content: widget.app.appDetails, isWideScreen: isWideScreen, width: cardWidth),
                      DemoPhone(app: widget.app, size: widget.phoneSize,)
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DemoPhone(app: widget.app, size: widget.phoneSize),
                      SizedBox(height: size.height*0.02),
                      appCard(content: widget.app.appDetails, isWideScreen: isWideScreen, width: cardWidth),
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

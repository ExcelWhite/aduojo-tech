import 'package:flutter/material.dart';
import 'package:portfolio/widgets/texts.dart';

import '../apps/apps.dart';
import '../constants/constants.dart';

Widget appCard({
  required Map<String, String> content,
  required bool isWideScreen
}){
  return Container(
    padding: EdgeInsets.all(isWideScreen ? 24: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.antiqueGold.withOpacity(0.2),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        reusableText(
            text: content['title']!,
            fontStyle: isWideScreen ? FontStyles.bigBoldText: FontStyles.mediumBoldText
        ),
        const SizedBox(height: 10),
        Flexible(
          child: reusableText(
              text: content['description']!,
              fontStyle: isWideScreen ? FontStyles.mediumText : FontStyles.regularText
          ),
        ),
        const SizedBox(height: 10),
        reusableText(text: 'Projected Features', fontStyle: isWideScreen ? FontStyles.mediumBoldText : FontStyles.regularBoldText),
        const SizedBox(height: 10),
        Flexible(
          child: reusableText(
              text: content['features']!,
              fontStyle: isWideScreen ? FontStyles.mediumText : FontStyles.regularText
          ),
        ),
      ],
    ),
  );
}


class DemoPhone extends StatefulWidget {
  final Size size;
  final Apps app;

  const DemoPhone({super.key, required this.app, required this.size});

  @override
  State<DemoPhone> createState() => _DemoPhoneState();
}

class _DemoPhoneState extends State<DemoPhone> {
  String? currentScreenKey;

  @override
  void initState() {
    super.initState();
    currentScreenKey = widget.app.initialScreenKey;
  }

  void changeScreen(String key) {
    setState(() {
      currentScreenKey = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenBuilder = widget.app.appScreens[currentScreenKey];
    final screen = screenBuilder?.call(changeScreen) ?? SizedBox.shrink();

    return SizedBox(
      width: widget.size.width+10,
      height: widget.size.height,
      child: Stack(
        children: [
          //phone frame
          Positioned(
            left: 5,
            top: 0,
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.silver, width: 3),
                color: Colors.transparent
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(1.0, 0.0), // Slide in from right
                      end: Offset.zero,
                    ).animate(animation);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey(currentScreenKey),
                    child: screen,
                  ),
                ),
              ),
            ),
          ),

          //buttons
          Positioned(
            left: 0,
            top: widget.size.height*0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sideButton(widget.size),
                SizedBox(height: widget.size.height*0.02, width: 5,),
                _sideButton(widget.size)
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: widget.size.height*0.23,
            child: _sideButton(widget.size)
          )
        ],
      ),
    );
  }

  Widget _sideButton(Size size) {
    return Container(
      width: 5,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
        color: AppColors.silver,
      ),
    );
  }
}


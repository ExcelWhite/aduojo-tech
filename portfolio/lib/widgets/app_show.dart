import 'package:flutter/material.dart';
import 'package:portfolio/constants/translatables.dart';
import 'package:portfolio/widgets/texts.dart';

import '../apps/apps.dart';
import '../constants/constants.dart';

Widget appCard({
  required Map<String, Translatable> appDetails,
  required bool isWideScreen,
  required double width,
  required bool isRussian
}){
  Map<String, String> content = isRussian
      ? {
        'title': appDetails['title']!.russian,
        'description': appDetails['description']!.russian,
        'features': appDetails['features']!.russian
      }
      : {
        'title': appDetails['title']!.english,
        'description': appDetails['description']!.english,
        'features': appDetails['features']!.english
      };
  return Container(
    width: width,
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
          fontStyle: isWideScreen ? FontStyles.bigBoldText: FontStyles.mediumBoldText,
          textAlign: TextAlign.start
        ),
        const SizedBox(height: 10),
        Flexible(
          child: reusableText(
            text: content['description']!,
            fontStyle: isWideScreen ? FontStyles.mediumText : FontStyles.regularText,
            textAlign: TextAlign.start
          ),
        ),
        const SizedBox(height: 10),
        // reusableText(
        //     text: isRussian ? 'Ожидаемые особенности' : 'Projected Features',
        //     fontStyle: isWideScreen ? FontStyles.mediumBoldText : FontStyles.regularBoldText
        // ),
        const SizedBox(height: 10),
        Flexible(
          child: reusableText(
              text: content['features']!,
              fontStyle: isWideScreen ? FontStyles.mediumText : FontStyles.regularText,
              textAlign: TextAlign.start
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
  List<String> screenStack = [];
  bool isPopping = false;


  @override
  void initState() {
    super.initState();
    currentScreenKey = widget.app.initialScreenKey;
  }

  void changeScreen(String key) {
    setState(() {
      isPopping = false;
      screenStack.add(currentScreenKey!);
      currentScreenKey = key;
    });
  }

  void popScreen() {
    if(screenStack.isNotEmpty) {
      setState(() {
        isPopping = true;
        currentScreenKey = screenStack.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenBuilder = widget.app.appScreens[currentScreenKey];
    final screen = screenBuilder?.call(changeScreen, popScreen) ?? SizedBox.shrink();

    return SizedBox(
      width: widget.size.width+10,
      height: widget.size.height,
      child: Stack(
        children: [
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
                    final beginOffset = isPopping ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0);
                    final offsetAnimation = Tween<Offset>(
                      begin: beginOffset,
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
                _leftSideButton(widget.size),
                SizedBox(height: widget.size.height*0.02, width: 5,),
                _leftSideButton(widget.size)
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: widget.size.height*0.23,
            child: _rightSideButton(widget.size)
          )
        ],
      ),
    );
  }

  Widget _leftSideButton(Size size) {
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

  Widget _rightSideButton(Size size) {
    return Container(
      width: 5,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
        color: AppColors.silver,
      ),
    );
  }
}


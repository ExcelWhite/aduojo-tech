import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/resume.dart';
import 'package:portfolio/widgets/socials.dart';
import 'package:portfolio/widgets/texts.dart';
import '../constants/constants.dart';
import '../constants/translatables.dart';
import '../widgets/buttons.dart';
import '../widgets/glitter_cursor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isRussian = false; // Language toggle state
  bool showResume = false;
  Offset _cursorPosition = Offset.zero;
  bool _isMoving = false;
  DateTime _lastMoveTime = DateTime.now();



  void setLanguage(bool toRussian) {
    setState(() {
      isRussian = toRussian; // Toggle the language
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallMobile = size.width < 425;

    final topBarChildren = [
      Text(
        'ADUOJO.TECH',
        style: GoogleFonts.cinzel(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.creamyIvory
        ),
      ),

      CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.royalMidnight,
        child: ClipOval(
          child: Image.asset(profilePicture, fit: BoxFit.cover, width: 100),
        ),
      )
    ];

    return Scaffold(
      backgroundColor: AppColors.royalMidnight,
      body: SafeArea(
        child: MouseRegion(
          onHover: (event) {
            final now = DateTime.now();
            setState(() {
              _cursorPosition = event.position;
              _isMoving = now.difference(_lastMoveTime).inMilliseconds < 50;
              _lastMoveTime = now;
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: GlitterTrail(cursorPosition: _cursorPosition, isMoving: _isMoving),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.03),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top bar
                        isSmallMobile
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: topBarChildren,
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: topBarChildren
                          ),

                        SizedBox(height: size.height*0.05,),

                        Container(
                          margin: EdgeInsets.only(left: size.width*0.1),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.creamyIvory.withOpacity(0),
                                // AppColors.antiqueGold,
                                AppColors.creamyIvory.withOpacity(0.2)
                              ]
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: reusableText(
                              text: isRussian
                                  ? mainScreenTranslatableTexts['introText']!.russian
                                  : mainScreenTranslatableTexts['introText']!.english,
                              textAlign: TextAlign.start,

                          ),
                        ),

                        const SizedBox(height: 5,),

                        if(showResume)
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: size.width*0.1),
                                width: size.width*0.8,
                                child: ResumeGridPage(isRussian: isRussian,)
                              ),
                              SizedBox(height: size.height*0.02,)
                            ],
                          ),


                        Center(
                          child: Column(
                            children: [
                              if(showResume)
                                DownloadResume(isRussian: isRussian),
                              showResume ? SizedBox(height: size.height*0.02,) : SizedBox.shrink(),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    showResume = !showResume;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      showResume
                                        ? FontAwesomeIcons.anglesUp
                                        : FontAwesomeIcons.anglesDown,
                                      size: 30,
                                      color: AppColors.antiqueGold,
                                    ),
                                    SizedBox(width: 5,),
                                    reusableText(
                                      text: isRussian
                                        ? showResume ? 'Скрыть резюме' : 'Просмотр в резюме'
                                        : showResume ? 'Hide Resume' : 'View Resume',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                left: size.width*0.03,
                top: size.height/2-150,
                child: SocialMediaIcons()
              )
            ],
          ),
        ),
      ),
      floatingActionButton: LanguageToggleButton(isRussian: isRussian, onToggle: setLanguage),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
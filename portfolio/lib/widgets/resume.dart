import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/texts.dart';

import '../constants/translatables.dart';

class ResumeGridPage extends StatelessWidget {
  final bool isRussian;

  const ResumeGridPage({super.key, required this.isRussian});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: StaggeredGrid.count(
          crossAxisCount: 10,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            HoverableSection(
              title: Translatable(english: 'Experience', russian: 'Опыт'),
              entries: experienceResumeEntries,
              isRussian: isRussian,
              crossAxisCellCount: 6,
              mainAxisCellCount: 3,
            ),
            HoverableSection(
              title: Translatable(english: 'Flutter Expertise', russian: 'Экспертиза Flutter'),
              entries: expertiseResumeTranslatableTexts,
              isRussian: isRussian,
              crossAxisCellCount: 4,
              mainAxisCellCount: 6,
            ),
            // HoverableSection(
            //   title: 'Flutter Expertise',
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 3,
            // ),
            // HoverableSection(
            //   title: 'Soft Skills',
            //   crossAxisCellCount: 1,
            //   mainAxisCellCount: 2,
            // ),
            // HoverableSection(
            //   title: 'Education',
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 1,
            // ),
            // HoverableSection(
            //   title: 'More Core Skills',
            //   crossAxisCellCount: 4,
            //   mainAxisCellCount: 1,
            // ),
          ],
        ),
      );
  }
}

class HoverableSection extends StatefulWidget {
  final Translatable title;
  final List<dynamic> entries;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final bool isRussian;

  const HoverableSection({
    super.key,
    required this.title,
    required this.entries,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.isRussian
  });

  @override
  _HoverableSectionState createState() => _HoverableSectionState();
}

class _HoverableSectionState extends State<HoverableSection> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    // Adjust sizes as proportions; for example enlarge by 10-15% on hover
    final scale = _hovering ? 1.1 : 1.0;
    final color = _hovering ? AppColors.gildedEmerald : Colors.transparent;
    final resumeWidth = MediaQuery.of(context).size.width*0.8;

    return StaggeredGridTile.count(
      crossAxisCellCount: widget.crossAxisCellCount,
      mainAxisCellCount: widget.mainAxisCellCount,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(scale),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.black54, blurRadius: 12, offset: Offset(0,6))]
                : [],
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              reusableText(
                text: widget.isRussian ? widget.title.russian : widget.title.english,
                fontStyle: FontStyles.mediumBoldText
              ),
              SizedBox(height: 10),

              Column(
                children: widget.entries.map((entry) {
                  Translatable translatable = entry['text'] as Translatable;
                  String text = widget.isRussian ? translatable.russian : translatable.english;
                  IconData icon = entry['icon'] as IconData;
                  double textWidth = (resumeWidth/10 -40)*widget.crossAxisCellCount;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FaIcon(icon, size: 20, color: AppColors.burnishedBrown,),
                      SizedBox(width: 10,),
                      SizedBox(
                        width: textWidth,
                        child: reusableText(
                          text: text,
                          //fontStyle: FontStyles.smallText,
                          textAlign: TextAlign.start
                        ))
                    ],
                  );
                }).toList(),
              )
              // Center(
              //   child: Text(
              //     widget.title,
              //     style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //       shadows: _hovering
              //           ? [Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(1,1))]
              //           : [],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:math' as math;
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 1440;

    final children = [
      HoverableSection(
        title: Translatable(english: 'Experience', russian: 'Опыт'),
        entries: experienceResumeEntries,
        isRussian: isRussian,
        crossAxisCellCount: isWideScreen ? 6 : 10,
        mainAxisCellCount: 2,
      ),
      HoverableSection(
        title: Translatable(english: 'Flutter Expertise', russian: 'Экспертиза Flutter'),
        entries: expertiseResumeEntries,
        isRussian: isRussian,
        crossAxisCellCount: isWideScreen ? 4 : 10,
        mainAxisCellCount: 4,
      ),
      HoverableSection(
        title: Translatable(english: 'Personal qualities', russian: 'Личные качества'),
        entries: qualitiesResumeEntries,
        isRussian: isRussian,
        crossAxisCellCount: isWideScreen ? 3 : 10,
        mainAxisCellCount: 3,
      ),
      HoverableSection(
        title: Translatable(english: 'Education', russian: 'Образование'),
        entries: educationResumeEntries,
        isRussian: isRussian,
        crossAxisCellCount: isWideScreen ? 3 : 10,
        mainAxisCellCount: 3,
      ),
      HoverableSection(
        title: Translatable(english: 'More Core Skills', russian: 'Дополнительные Ключевые Навыки'),
        entries: moreCoreSkillsResumeEntries,
        isRussian: isRussian,
        crossAxisCellCount: isWideScreen ? 7 : 10,
        mainAxisCellCount: 2,
      ),
    ];

    Widget layout = isWideScreen
        ? StaggeredGrid.count(
      crossAxisCount: 10,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: children,
    )
        : Column(
      children: children
          .map((child) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: child,
      ))
          .toList(),
    );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        layoutBuilder: (currentChild, previousChildren) {
          return currentChild!;
        },
        child: KeyedSubtree(
          key: ValueKey(isWideScreen),
          child: layout,
        ),
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
    required this.isRussian,
  });

  @override
  _HoverableSectionState createState() => _HoverableSectionState();
}

class _HoverableSectionState extends State<HoverableSection> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final scale = _hovering ? 1.05 : 1.0;
    final color = _hovering ? AppColors.gildedEmerald.withOpacity(0.5) : Colors.transparent;
    final screenWidth = MediaQuery.of(context).size.width;
    final resumeWidth = screenWidth * 0.8;
    final isWideScreen = screenWidth > 1440;

    final sectionContent = MouseRegion(
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
              ? [
            BoxShadow(
                color: AppColors.velvetMaroon,
                blurRadius: 12,
                offset: Offset(0, 6)
            )
          ]
              : [],
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reusableText(
              text: widget.isRussian
                  ? widget.title.russian
                  : widget.title.english,
              fontStyle: isWideScreen ? FontStyles.bigBoldText : FontStyles.mediumBoldText,
            ),
            SizedBox(height: 10),

            //entries
            Column(
              children: widget.entries.map((entry) {
                Translatable translatable = entry['text'] as Translatable;
                String text = widget.isRussian
                    ? translatable.russian
                    : translatable.english;
                IconData icon = entry['icon'] as IconData;
                double textWidth = math.min(
                    (resumeWidth / 10 - 40) * widget.crossAxisCellCount,
                    screenWidth * 0.9);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaIcon(
                        icon,
                        size: 20,
                        color: AppColors.antiqueGold,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: reusableText(
                          text: text,
                          textAlign: TextAlign.start,
                          //fontStyle: isWideScreen ? FontStyles.mediumText : FontStyles.regularText,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );

    // On small screen, just return directly
    if (widget.crossAxisCellCount == 10) {
      return sectionContent;
    }

    return StaggeredGridTile.count(
      crossAxisCellCount: widget.crossAxisCellCount,
      mainAxisCellCount: widget.mainAxisCellCount,
      child: sectionContent,
    );
  }
}

class DownloadResume extends StatefulWidget {
  final bool isRussian;

  const DownloadResume({super.key, required this.isRussian});
  @override
  _DownloadResumeState createState() => _DownloadResumeState();
}

class _DownloadResumeState extends State<DownloadResume> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final scale = _hovering ? 1.05 : 1.0;
    final color = _hovering ? AppColors.gildedEmerald.withOpacity(0.5) : Colors.transparent;
    final isWideScreen = MediaQuery.of(context).size.width > 1440;

    return MouseRegion(
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
              ? [
            BoxShadow(
                color: AppColors.velvetMaroon,
                blurRadius: 12,
                offset: Offset(0, 6)
            )
          ]
              : [],
        ),
        child: GestureDetector(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.fileArrowDown,
                  size: 30,
                  color: AppColors.antiqueGold,
                ),
                SizedBox(width: 5,),
                reusableText(
                  text: widget.isRussian ? 'Скачать резюме' : 'Download Resume',
                  fontStyle: isWideScreen ? FontStyles.mediumText : FontStyles.regularText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

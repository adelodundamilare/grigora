import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:origora/utils/app_fonts.dart';
import 'package:origora/utils/palette.dart';
import 'package:origora/widgets/ui_helper.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double textSize;
  final Color textColor;
  final TextOverflow overflow;
  final double height;
  final int maxLines;
  final bool isBoldFont;
  final bool uppercase;
  final double letterSpacing;

  AppText(this.text,
      {this.textAlign = TextAlign.left,
      this.textSize,
      this.textColor,
      this.maxLines,
      this.overflow,
      this.letterSpacing,
      this.uppercase = false,
      this.height,
      this.isBoldFont = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      uppercase ? text.toUpperCase() : text,
      textAlign: textAlign ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines ?? 100,
      style: new TextStyle(
        fontFamily: isBoldFont ? AppFonts.bold : AppFonts.medium,
        letterSpacing: letterSpacing ?? 0,
        color: textColor ?? Palette.text,
        fontSize: textSize ?? 18,
        height: height ?? 1.2,
      ),
    );
  }
}

class TitleModel {
  final String text;
  final bool isSpecial;
  TitleModel({this.text, this.isSpecial = false});
}

class AppTitle extends StatelessWidget {
  final List<TitleModel> texts;
  AppTitle({this.texts});
  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: TextStyle(
              fontSize: 22,
              color: Palette.text,
              fontFamily: AppFonts.bold,
            ),
            children: texts is List<TitleModel>
                ? texts
                    .map((e) => TextSpan(
                        text: e.text,
                        style: TextStyle(
                            color:
                                e.isSpecial ? Palette.accent : Palette.text)))
                    .toList()
                : <TextSpan>[
                    TextSpan(
                      text: 'expecting List<TextSpan>',
                    ),
                  ]));
  }
}

class SectionTitle extends StatelessWidget {
  final Widget titleWidget;
  final String subtitle;
  final bool hideViewAll;
  SectionTitle({this.titleWidget, this.subtitle, this.hideViewAll = false});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                titleWidget ?? AppText('no_title_wdget'),
                UIHelper.verticalSpaceVerySmall,
                AppText(
                  subtitle ?? 'no_subtitle',
                  textSize: 13,
                  textColor: Palette.text.withOpacity(0.6),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: !hideViewAll,
          child: Row(
            children: <Widget>[
              AppText(
                'View All',
                textColor: Palette.primary,
                isBoldFont: true,
                textSize: 14,
              ),
              UIHelper.horizontalSpaceSmall,
              Icon(
                FontAwesomeIcons.arrowRight,
                color: Palette.primary,
                size: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}

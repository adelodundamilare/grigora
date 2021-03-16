import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:origora/constants/images.dart';
import 'package:origora/utils/palette.dart';
import 'package:origora/widgets/app_text.dart';
import 'package:origora/widgets/ui_helper.dart';

class RestaurantEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: AppText('you have 0 restarants'));
  }
}

class RestaurantLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Container(
            color: Palette.text.withOpacity(0.1),
            width: 100,
            height: 120,
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                __LoadBar(
                  width: 150,
                  height: 10,
                ),
                UIHelper.verticalSpaceVerySmall,
                __LoadBar(
                  width: 120,
                  height: 10,
                ),
                UIHelper.verticalSpaceSmall,
                Row(
                  children: <Widget>[
                    __LoadBar(
                      width: 50,
                      height: 10,
                    ),
                    __LoadBar(
                      width: 50,
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Restaurant extends StatelessWidget {
  final String title, image, price;
  final int averageRating, time;
  final Color bgColor;
  final Function onTap;
  final Color boderColor;

  Restaurant(
      {this.title,
      this.image,
      this.onTap,
      this.price,
      this.bgColor,
      this.boderColor,
      this.averageRating,
      this.time});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => print('tapping single restaurant'),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: bgColor ?? Colors.transparent,
            border: boderColor is Color ? Border.all(color: boderColor) : null),
        child: Row(
          children: <Widget>[
            SizedBox(
                width: 100,
                height: 120,
                child: image is String
                    ? Image.network(
                        image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        ConstantImages.logo,
                        fit: BoxFit.cover,
                      )),
            UIHelper.horizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    title ?? 'no_title',
                    isBoldFont: true,
                    maxLines: 1,
                  ),
                  UIHelper.verticalSpaceVerySmall,
                  AppText(
                    '0.92KM Away',
                    textSize: 14,
                    textColor: Palette.text.withOpacity(0.5),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Row(
                    children: <Widget>[
                      __Badge(
                        isHigh: averageRating is int && averageRating > 3
                            ? true
                            : false,
                        text: averageRating is int
                            ? averageRating.toString()
                            : 'no_rating',
                      ),
                      time == null
                          ? Container()
                          : __Time(
                              text: time is int ? '$time mins' : null,
                            )
                    ],
                  ),
                  UIHelper.verticalSpaceSmall,
                  price is String ? AppText('N$price') : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class __Time extends StatelessWidget {
  final String text;
  __Time({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Row(
        children: <Widget>[
          Icon(
            EvaIcons.closeCircle,
            size: 10,
            color: Palette.accent,
          ),
          AppText(
            text ?? 'no_text',
            textSize: 16,
          ),
        ],
      ),
    );
  }
}

class __Badge extends StatelessWidget {
  final bool isHigh; // @todo: change to enum
  final String text;
  __Badge({this.isHigh = false, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isHigh ? Palette.green : Palette.text.withOpacity(0.4)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Palette.white,
            size: 16,
          ),
          AppText(
            text ?? 'no_text',
            textColor: Palette.white,
            textSize: 14,
          ),
        ],
      ),
    );
  }
}

class __LoadBar extends StatelessWidget {
  final double width, height;
  __LoadBar({this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80,
      height: height ?? 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.text.withOpacity(0.1)),
    );
  }
}

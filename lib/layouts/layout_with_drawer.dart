import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:origora/utils/palette.dart';
import 'package:origora/constants/images.dart';
import 'package:origora/widgets/app_text.dart';
import 'package:origora/widgets/ui_helper.dart';

class LayoutWithDrawer extends StatelessWidget {
  final Widget body;
  LayoutWithDrawer({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      endDrawer: _Drawer(),
      body: body ?? AppText('layout has no_body'),
    );
  }
}

PreferredSizeWidget _appBar() => AppBar(
      automaticallyImplyLeading: true,
      leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Image.asset(ConstantImages.logo)),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            EvaIcons.pinOutline,
            color: Palette.text,
          ),
          AppText(
            'Wuse 2, Abuja',
            isBoldFont: true,
          ),
          UIHelper.horizontalSpaceSmall,
          Icon(
            EvaIcons.chevronDown,
            color: Palette.text.withOpacity(0.5),
          ),
        ],
      ),
      actions: <Widget>[
        Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: Icon(
              EvaIcons.menu,
              size: 28,
            ),
            color: Palette.text,
          );
        })
      ],
      iconTheme: IconThemeData(color: Palette.white),
      backgroundColor: Palette.white,
      elevation: 0.6,
    );

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: Palette.text.withOpacity(0.6),
                    size: 28,
                  ),
                ),
              ),
              __DrawerItem(
                text: 'Sign In/ Sign Up',
                icon: EvaIcons.personOutline,
                iconColor: Palette.accent,
              ),
              __Line(),
              __DrawerItem(
                text: 'Home',
                icon: EvaIcons.homeOutline,
                iconColor: Palette.primary,
              ),
              __DrawerItem(
                text: 'About Grigora',
                icon: EvaIcons.infoOutline,
              ),
              __DrawerItem(
                text: 'Help & Support',
                icon: EvaIcons.questionMarkCircleOutline,
              ),
              __DrawerItem(
                text: 'Partner with us',
                icon: EvaIcons.briefcaseOutline,
              ),
              __Line(
                isLoud: true,
              ),
              __DrawerItem(
                  text: '+234 901 066 9160',
                  icon: EvaIcons.phoneOutline,
                  isSmall: true),
              __DrawerItem(
                  text: 'hello@grigora.ng',
                  icon: EvaIcons.emailOutline,
                  isSmall: true),
            ],
          ),
        ),
      ),
    );
  }
}

class __Line extends StatelessWidget {
  final bool isLoud;
  __Line({this.isLoud = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.text.withOpacity(0.1),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      height: isLoud ? 2 : 1,
    );
  }
}

class __DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final bool isSmall;
  __DrawerItem({this.text, this.icon, this.iconColor, this.isSmall = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: <Widget>[
          Icon(
            icon ?? Icons.close,
            size: isSmall ? 20 : 28,
            color: iconColor ?? Palette.text,
          ),
          UIHelper.horizontalSpaceMedium,
          AppText(
            text ?? 'no_text',
            isBoldFont: isSmall ? false : true,
            textSize: isSmall ? 16 : 20,
          )
        ],
      ),
    );
  }
}

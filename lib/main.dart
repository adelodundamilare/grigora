import 'package:flutter/material.dart';
import 'package:origora/screens/screen_details.dart';
import 'package:origora/screens/screen_home.dart';
import 'package:origora/utils/palette.dart';
import 'package:logger/logger.dart';
import 'package:origora/utils/app_fonts.dart';
import 'package:origora/enums/routes.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.level = Level.verbose;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final MaterialColor primarySwatch = MaterialColor(0xFFCA3114, {
    50: Palette.primary,
    100: Palette.primary,
    200: Palette.primary,
    300: Palette.primary,
    400: Palette.primary,
    500: Palette.primary,
    600: Palette.primary,
    700: Palette.primary,
    800: Palette.primary,
    900: Palette.primary,
  });

  TextTheme _buildTextTheme(TextTheme base) {
    return base
        .copyWith(
          // headline1: base.headline1
          //     .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
          // subtitle1: base.subtitle1
          //     .copyWith(fontSize: 25.0, fontWeight: FontWeight.w700),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        )
        .apply(
          fontFamily: AppFonts.medium,
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [],
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: _buildTextTheme(Theme.of(context).textTheme),
              primaryTextTheme:
                  _buildTextTheme(Theme.of(context).primaryTextTheme),
              accentTextTheme:
                  _buildTextTheme(Theme.of(context).accentTextTheme),
              primarySwatch: primarySwatch,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              backgroundColor: Colors.white,
            ),
            home: ScreenHome(),
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case EnumRoutes.home:
                  return MyCustomRoute(
                      builder: (_) => ScreenHome(), settings: settings);
                case EnumRoutes.details:
                  return MyCustomRoute(
                      builder: (_) => ScreenDetails(), settings: settings);
                default:
                  return MyCustomRoute(
                      builder: (_) => ScreenHome(), settings: settings);
              }
            },
          );
        });
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}

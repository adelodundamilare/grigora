import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:origora/enums/routes.dart';
import 'package:origora/layouts/layout_with_drawer.dart';
import 'package:origora/models/restaurant.dart';
import 'package:origora/screens/screen_home_vm.dart';
import 'package:origora/utils/base_widget.dart';
import 'package:origora/utils/misc_models.dart';
import 'package:origora/utils/palette.dart';
import 'package:origora/widgets/app_text.dart';
import 'package:origora/widgets/restaurant.dart';
import 'package:origora/widgets/ui_helper.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ScreenHomeVM>(
      model: ScreenHomeVM(),
      onInitState: (model) => model.mounted(),
      builder: (context, model, child) {
        return LayoutWithDrawer(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _NewInGrigora(),
                  UIHelper.verticalSpaceMedium,
                  _RestaurantsNearYou()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NewInGrigora extends StatefulWidget {
  @override
  __NewInGrigoraState createState() => __NewInGrigoraState();
}

class __NewInGrigoraState extends State<_NewInGrigora> {
  PageController controller =
      PageController(viewportFraction: 0.8, keepPage: true);
  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }

  void changePageViewPostion(int whichPage, int mItemCount) {
    if (controller == null) return;

    whichPage = whichPage + 1; // because position will start from 0
    double jumpPosition = MediaQuery.of(context).size.width / 2;
    double orgPosition = MediaQuery.of(context).size.width / 2;
    for (int i = 0; i < mItemCount; i++) {
      controller.jumpTo(jumpPosition);
      if (i == whichPage) {
        break;
      }
      jumpPosition = jumpPosition + orgPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ScreenHomeVM>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(
          subtitle: 'Recently added senders',
          titleWidget: AppTitle(texts: [
            TitleModel(text: 'New ', isSpecial: true),
            TitleModel(text: 'in Grigora')
          ]),
        ),
        UIHelper.verticalSpaceVerySmall,
        Stack(
          children: <Widget>[
            SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: controller,
                  itemCount: model.getLoadingRestaurant()
                      ? 3
                      : model.getRestaurants().restaurants.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, position) {
                    List<SingleRestaurantModel> restaurants =
                        model.getLoadingRestaurant()
                            ? []
                            : model.getRestaurants().restaurants;
                    return model.getLoadingRestaurant()
                        ? RestaurantLoading()
                        : model.getRestaurants().restaurants.length > 0
                            ? Restaurant(
                                onTap: () => Navigator.pushNamed(
                                    context, EnumRoutes.details,
                                    arguments: DetailsArgs(
                                        name: restaurants[position].name,
                                        networkImage:
                                            restaurants[position].image)),
                                title: restaurants[position].name,
                                image: restaurants[position].image,
                                bgColor: Palette.text.withOpacity(0.1),
                                time: restaurants[position].preparingTime,
                                averageRating:
                                    restaurants[position].averageRating,
                              )
                            : RestaurantEmpty();
                  }),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Visibility(
                visible: !model.getLoadingRestaurant(),
                child: InkWell(
                  onTap: () {
                    changePageViewPostion(
                        2, model.getRestaurants().restaurants.length);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Palette.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Palette.accent, width: 2)),
                    child: Icon(
                      EvaIcons.arrowRight,
                      color: Palette.accent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _RestaurantsNearYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ScreenHomeVM>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(
          subtitle:
              'Enjoy delicious meals from restaurants and vendors around you',
          titleWidget: AppTitle(texts: [
            TitleModel(
              text: 'Restaurants ',
            ),
            TitleModel(text: 'Near ', isSpecial: true),
            TitleModel(
              text: 'You',
            )
          ]),
        ),
        UIHelper.verticalSpaceVerySmall,
        SizedBox(
          height: 300,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: model.getLoadingRestaurant()
                  ? 3
                  : model.getRestaurants().restaurants.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, position) {
                List<SingleRestaurantModel> restaurants =
                    model.getLoadingRestaurant()
                        ? []
                        : model.getRestaurants().restaurants;
                return model.getLoadingRestaurant()
                    ? RestaurantLoading()
                    : Restaurant(
                        onTap: () => Navigator.pushNamed(
                            context, EnumRoutes.details,
                            arguments: DetailsArgs(
                                name: restaurants[position].name,
                                networkImage: restaurants[position].image)),
                        title: restaurants[position].name,
                        image: restaurants[position].image,
                        time: restaurants[position].preparingTime,
                        averageRating: restaurants[position].averageRating,
                      );
              }),
        )
      ],
    );
  }
}

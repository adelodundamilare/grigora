import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:origora/enums/routes.dart';
import 'package:origora/models/details.dart';
import 'package:origora/screens/screen_details_vm.dart';
import 'package:origora/utils/app_fonts.dart';
import 'package:origora/utils/base_widget.dart';
import 'package:origora/utils/helpers.dart';
import 'package:origora/utils/misc_models.dart';
import 'package:origora/utils/palette.dart';
import 'package:origora/widgets/app_text.dart';
import 'package:origora/widgets/restaurant.dart';
import 'package:origora/widgets/ui_helper.dart';
import 'package:provider/provider.dart';

class ScreenDetails extends StatelessWidget {
  final List<_TabInterface> _tabs = [
    _TabInterface(title: 'Daily Meals & Diets', widget: _FeaturedItems()),
    _TabInterface(
      title: 'Fries & Grills',
      widget: _FeaturedItems(),
    ),
    _TabInterface(
      title: 'Dishes',
      widget: _FeaturedItems(),
    ),
    _TabInterface(
      title: 'Soups',
      widget: _FeaturedItems(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ScreenDetailVM>(
        onInitState: (model) => model.mounted(),
        model: ScreenDetailVM(),
        builder: (context, model, child) {
          return DefaultTabController(
              length: _tabs.length,
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        // title: AppText(
                        //   args.name,
                        //   textColor: Palette.white,
                        // ),
                        pinned: true,
                        floating: true,
                        centerTitle: true,
                        expandedHeight:
                            MediaQuery.of(context).size.height / 1.2,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          // title: AppText(
                          //   args.name,
                          //   textColor: Palette.white,
                          // ),
                          background: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: _Header(),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          child: PreferredSize(
                            preferredSize: Size.fromHeight(0),
                            child: TabBar(
                              isScrollable: true,
                              indicatorColor: Palette.primary,
                              labelColor: Palette.primary,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 2,
                              labelStyle: TextStyle(
                                  fontFamily: AppFonts.bold, fontSize: 16),
                              unselectedLabelColor: Palette.text,
                              tabs: List<Widget>.generate(_tabs.length,
                                  (int index) {
                                return Tab(
                                  text: _tabs[index].title ?? 'no_tab_text',
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: _FeaturedItems(),
                  ),
                ),
              ));
        });
  }
}

class _FeaturedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ScreenDetailVM>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SectionTitle(
            hideViewAll: true,
            subtitle: 'Vendors featured items',
            titleWidget: AppTitle(texts: [
              TitleModel(text: 'Featured ', isSpecial: true),
              TitleModel(text: 'Items')
            ]),
          ),
          UIHelper.verticalSpaceSmall,
          HorizontalRestaurant(
              isLoading: model.getIsLoading(),
              count: model?.getDetail()?.featuredItems?.length,
              restaurants: model.getDetail()?.featuredItems),
        ],
      ),
    );
  }
}

class HorizontalRestaurant extends StatelessWidget {
  final bool isLoading;
  final int count;
  final List<FeaturedItems> restaurants;
  HorizontalRestaurant(
      {this.isLoading = false, this.count = 0, this.restaurants});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          controller: PageController(viewportFraction: 0.8, keepPage: true),
          itemCount: isLoading ? 3 : count,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, position) {
            return isLoading
                ? RestaurantLoading()
                : count > 0
                    ? Restaurant(
                        onTap: () => Navigator.pushNamed(
                            context, EnumRoutes.details,
                            arguments: DetailsArgs(
                                name: restaurants[position].name,
                                networkImage: restaurants[position].image)),
                        title: restaurants[position].name,
                        image: restaurants[position].image,
                        bgColor: Colors.transparent,
                        boderColor: Palette.text.withOpacity(0.1),
                        time: null,
                        price: restaurants[position].price,
                        averageRating:
                            restaurants[position].avgRatings is String
                                ? Helpers.convertStringToInt(
                                    restaurants[position].avgRatings)
                                : restaurants[position].avgRatings,
                      )
                    : RestaurantEmpty();
          }),
    );
  }
}

class _TabInterface {
  String title;
  Widget widget;
  _TabInterface({this.title, this.widget});
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ScreenDetailVM>(context);
    return model.getIsLoading() ? __HeaderContentLoading() : __HeaderContent();
  }
}

class __HeaderContentLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailsArgs args = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(args.networkImage),
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Palette.black.withOpacity(0.8),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      args.networkImage,
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  AppText(
                    args.name,
                    textColor: Palette.white,
                    isBoldFont: true,
                    textSize: 24,
                  ),
                  UIHelper.verticalSpaceSmall,
                  __LoadBar(
                    width: 150,
                    height: 10,
                    onBlackBg: true,
                  ),
                  UIHelper.verticalSpaceSmall,
                  __LoadBar(
                    width: 250,
                    height: 10,
                    onBlackBg: true,
                  ),
                  UIHelper.verticalSpaceSmall,
                  __LoadBar(
                    width: 150,
                    height: 10,
                    onBlackBg: true,
                  ),
                  UIHelper.verticalSpaceSmall,
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Palette.white.withOpacity(0.5),
                  ),
                  UIHelper.verticalSpaceSmall,
                  __LoadBar(
                    width: 150,
                    height: 10,
                    onBlackBg: true,
                  ),
                  UIHelper.verticalSpaceSmall,
                  __LoadBar(
                    width: 250,
                    height: 10,
                    onBlackBg: true,
                  ),
                  UIHelper.verticalSpaceMedium,
                  __LoadBar(
                    width: 250,
                    height: 10,
                    onBlackBg: true,
                  ),
                  UIHelper.verticalSpaceMedium,
                  __LoadBar(
                    width: 150,
                    height: 10,
                    onBlackBg: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// @todo: convert to global widget this is more up to date anyways...
class __LoadBar extends StatelessWidget {
  final double width, height;
  final bool onBlackBg;
  __LoadBar({this.width, this.height, this.onBlackBg = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80,
      height: height ?? 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: onBlackBg
              ? Palette.white.withOpacity(0.5)
              : Palette.text.withOpacity(0.1)),
    );
  }
}

class __HeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ScreenDetailVM>(context);
    final DetailsModel data = model.getDetail();
    DetailsArgs args = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(args.networkImage),
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Palette.black.withOpacity(0.8),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      args.networkImage,
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  AppText(
                    args.name,
                    textColor: Palette.white,
                    isBoldFont: true,
                    textSize: 24,
                  ),
                  UIHelper.verticalSpaceSmall,
                  AppText(
                    data?.cuisines ?? 'no_cuisines',
                    textColor: Palette.white,
                    isBoldFont: true,
                    textSize: 14,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            EvaIcons.starOutline,
                            color: Palette.white,
                          ),
                          UIHelper.horizontalSpaceVerySmall,
                          AppText(
                            '0',
                            textColor: Palette.white,
                          ),
                          AppText(
                            data?.totalReview is int
                                ? ' (${data?.totalReview} REVIEWS)'
                                : 'no_review',
                            textColor: Palette.white,
                          ),
                          UIHelper.horizontalSpaceSmall,
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Palette.white),
                            width: 10,
                            height: 10,
                          ),
                          UIHelper.horizontalSpaceSmall,
                          AppText(
                            data.pickup is String
                                ? '${data.pickup} KM Away'
                                : 'no_pickup',
                            textColor: Palette.white,
                            isBoldFont: true,
                          ),
                        ],
                      )
                    ],
                  ),
                  UIHelper.verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AppText(
                            model.isOpen(data.openingTime, data.closingTime)
                                ? 'OPEN'
                                : 'CLOSED',
                            textColor:
                                model.isOpen(data.openingTime, data.closingTime)
                                    ? Palette.green
                                    : Palette.red,
                            isBoldFont: true,
                          ),
                          UIHelper.horizontalSpaceSmall,
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Palette.white),
                            width: 10,
                            height: 10,
                          ),
                          UIHelper.horizontalSpaceSmall,
                          Icon(
                            Icons.info_outline,
                            color: Palette.white,
                          ),
                          AppText(
                            ' MORE INFO',
                            textColor: Palette.white,
                            isBoldFont: true,
                          ),
                        ],
                      )
                    ],
                  ),
                  UIHelper.verticalSpaceSmall,
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Palette.white.withOpacity(0.5),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      __OrderInfo(text: 'Min. Order', value: 'N200'),
                      __OrderInfo(
                          text: 'Prep. Time',
                          value: data.estimatedPreparingTime is String
                              ? '${data.estimatedPreparingTime} mins'
                              : 'no_time'),
                      __OrderInfo(
                          text: 'Delivery Fee',
                          value: data.deliveryFee is int
                              ? 'From N${data.deliveryFee}'
                              : 'no_fee'),
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      __DeliveryTag(),
                      UIHelper.horizontalSpaceVerySmall,
                      __StartGroupOrder()
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,
                  __ChooseMenu()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class __ChooseMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppText(
          'Choose Menu',
          textSize: 14,
          textColor: Palette.accent,
        ),
        UIHelper.verticalSpaceVerySmall,
        Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
                border: Border.all(color: Palette.accent),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 150,
                  child: AppText(
                    'All Time',
                    // textSize: 14,
                    isBoldFont: true,
                    textAlign: TextAlign.center,
                    textColor: Palette.accent,
                  ),
                ),
                UIHelper.horizontalSpaceVerySmall,
                Icon(
                  EvaIcons.chevronDown,
                  color: Palette.accent,
                ),
              ],
            ))
      ],
    );
  }
}

class __StartGroupOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(color: Palette.white),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            Icon(
              EvaIcons.peopleOutline,
              color: Palette.white,
            ),
            UIHelper.horizontalSpaceVerySmall,
            AppText(
              'Start Group Order',
              textSize: 14,
              isBoldFont: true,
              textColor: Palette.white,
            ),
          ],
        ));
  }
}

class __DeliveryTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        decoration: BoxDecoration(
            color: Palette.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            AppText(
              'Delivery',
              textSize: 14,
            ),
            Container(
              height: 2,
              width: 1,
              color: Palette.white,
            ),
            Icon(EvaIcons.chevronDown)
          ],
        ));
  }
}

class __OrderInfo extends StatelessWidget {
  final String text, value;
  __OrderInfo({this.text, this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppText(
            text ?? 'no_text',
            textSize: 14,
            textColor: Palette.accent,
          ),
          AppText(
            value ?? 'no_value',
            isBoldFont: true,
            textColor: Palette.white,
            textSize: 20,
          )
        ],
      ),
    );
  }
}

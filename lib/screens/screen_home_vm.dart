import 'package:origora/utils/base_model.dart';
import 'package:origora/utils/app_log_printer.dart';
import 'package:origora/models/restaurant.dart';

class ScreenHomeVM extends BaseModel {
  final logger = getLogger("screen_home_vm.dart");

  void mounted() async {
    setRestarants(await fetchRestaurants());
  }

  Future<RestaurantModel> fetchRestaurants() async {
    RestaurantModel result;
    try {
      setLoadingRestaurant(true);
      result = await RestaurantModel.getRestaurants();
      setLoadingRestaurant(false);
    } catch (error) {
      logger.e(
          "****************** ScreenHomeVM.getRestaurants() **********************");
      logger.e(error);
      setLoadingRestaurant(false);
    }

    return result;
  }

  RestaurantModel _restaurants;
  RestaurantModel getRestaurants() => _restaurants;
  void setRestarants(RestaurantModel value) {
    _restaurants = value;
    notifyListeners();
  }

  bool _loadingRestaurant = false;
  bool getLoadingRestaurant() => _loadingRestaurant;
  void setLoadingRestaurant(bool value) {
    _loadingRestaurant = value;
    notifyListeners();
  }
}

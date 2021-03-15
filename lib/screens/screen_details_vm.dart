import 'package:origora/models/details.dart';
import 'package:origora/utils/base_model.dart';
import 'package:origora/utils/app_log_printer.dart';

class ScreenDetailVM extends BaseModel {
  final logger = getLogger("screen_details_vm.dart");

  void mounted() async {
    setDetail(await fetchDetail());
  }

  Future<DetailsModel> fetchDetail() async {
    DetailsModel result;
    try {
      setIsLoading(true);
      result = await DetailsModel.getDetail();
      setIsLoading(false);
    } catch (error) {
      setIsLoading(false);
      logger.e(
          "****************** ScreenDetailVM.fetchDetail() **********************");
      logger.e(error);
    }

    return result;
  }

  bool isOpen(String startTime, String endTime) {
    try {
      // startTime = '06:30:00';
      DateTime now = DateTime.now();
      List<String> startTimeParts = startTime.split(":");
      List<String> endTimeParts = endTime.split(":");

      // parse received time...
      DateTime openingTime =
          DateTime(now.year, now.month, now.day, int.parse(startTimeParts[0]));
      DateTime closingTime =
          DateTime(now.year, now.month, now.day, int.parse(endTimeParts[0]));

      bool isBeforeOpeningTime = openingTime.isBefore(now);
      bool isAfterOpeningTime = closingTime.isAfter(now);

      return (isAfterOpeningTime && isBeforeOpeningTime) ? true : false;
    } catch (error) {}
    return false;
  }

  DetailsModel _detail;
  DetailsModel getDetail() => _detail;
  void setDetail(DetailsModel value) {
    _detail = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool getIsLoading() => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

class Helpers {
  static int convertStringToInt(String value) {
    try {
      return int.parse(value);
    } catch (error) {
      print('cannot convert string to int');
    }
    return 0;
  }
}

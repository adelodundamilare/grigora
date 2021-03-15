class Endpoints {
  static const BASE_URL = "https://us-central1-grigora-alt.cloudfunctions.net";

  static String getHomeRestaurants() {
    return BASE_URL + "/home";
  }

  static String getDetail() {
    return BASE_URL + "/details";
  }
}

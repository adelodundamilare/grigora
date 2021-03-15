import 'package:origora/utils/api.dart';
import 'package:origora/utils/endpoints.dart';

class RestaurantModel {
  List<Cuisines> cuisines;
  List<Promos> promos;
  List<SingleRestaurantModel> restaurants;

  RestaurantModel({this.cuisines, this.promos, this.restaurants});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    if (json['cuisines'] != null) {
      cuisines = new List<Cuisines>();
      json['cuisines'].forEach((v) {
        cuisines.add(new Cuisines.fromJson(v));
      });
    }
    if (json['promos'] != null) {
      promos = new List<Promos>();
      json['promos'].forEach((v) {
        promos.add(new Promos.fromJson(v));
      });
    }
    if (json['restaurants'] != null) {
      restaurants = new List<SingleRestaurantModel>();
      json['restaurants'].forEach((v) {
        restaurants.add(new SingleRestaurantModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cuisines != null) {
      data['cuisines'] = this.cuisines.map((v) => v.toJson()).toList();
    }
    if (this.promos != null) {
      data['promos'] = this.promos.map((v) => v.toJson()).toList();
    }
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<RestaurantModel> getRestaurants() async {
    Map<String, dynamic> res = await ServiceApi().get(
      Endpoints.getHomeRestaurants(),
    );
    RestaurantModel result = RestaurantModel.fromJson(res);

    return result;
  }
}

class Cuisines {
  int id;
  String name;
  String frenchName;
  String description;
  String frenchDescription;
  String image;
  String icon;
  String backgroundIcon;
  String status;
  String createdAt;
  String updatedAt;
  bool selected;

  Cuisines(
      {this.id,
      this.name,
      this.frenchName,
      this.description,
      this.frenchDescription,
      this.image,
      this.icon,
      this.backgroundIcon,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.selected});

  Cuisines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    frenchName = json['french_name'];
    description = json['description'];
    frenchDescription = json['french_description'];
    image = json['image'];
    icon = json['icon'];
    backgroundIcon = json['background_icon'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['description'] = this.description;
    data['french_description'] = this.frenchDescription;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['background_icon'] = this.backgroundIcon;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['selected'] = this.selected;
    return data;
  }
}

class Promos {
  int id;
  String name;
  String image;
  String frenchName;
  String description;
  String frenchDescription;
  String code;

  Promos(
      {this.id,
      this.name,
      this.image,
      this.frenchName,
      this.description,
      this.frenchDescription,
      this.code});

  Promos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    frenchName = json['french_name'];
    description = json['description'];
    frenchDescription = json['french_description'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['french_name'] = this.frenchName;
    data['description'] = this.description;
    data['french_description'] = this.frenchDescription;
    data['code'] = this.code;
    return data;
  }
}

class SingleRestaurantModel {
  int id;
  String name;
  String frenchName;
  String image;
  String address;
  String frenchAddress;
  String pickup;
  int preparingTime;
  String tableBooking;
  bool busyStatus;
  int noOfSeats;
  int averageRating;
  int totalRating;
  String latitude;
  String longitude;
  String status;

  SingleRestaurantModel(
      {this.id,
      this.name,
      this.frenchName,
      this.image,
      this.address,
      this.frenchAddress,
      this.pickup,
      this.preparingTime,
      this.tableBooking,
      this.busyStatus,
      this.noOfSeats,
      this.averageRating,
      this.totalRating,
      this.latitude,
      this.longitude,
      this.status});

  SingleRestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    frenchName = json['french_name'];
    image = json['image'];
    address = json['address'];
    frenchAddress = json['french_address'];
    pickup = json['pickup'];
    preparingTime = json['preparing_time'];
    tableBooking = json['table_booking'];
    busyStatus = json['busy_status'];
    noOfSeats = json['no_of_seats'];
    averageRating = json['average_rating'];
    totalRating = json['total_rating'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['image'] = this.image;
    data['address'] = this.address;
    data['french_address'] = this.frenchAddress;
    data['pickup'] = this.pickup;
    data['preparing_time'] = this.preparingTime;
    data['table_booking'] = this.tableBooking;
    data['busy_status'] = this.busyStatus;
    data['no_of_seats'] = this.noOfSeats;
    data['average_rating'] = this.averageRating;
    data['total_rating'] = this.totalRating;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    return data;
  }
}

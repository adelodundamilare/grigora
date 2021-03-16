import 'package:origora/utils/api.dart';
import 'package:origora/utils/endpoints.dart';

class DetailsModel {
  int deliveryFee;
  int restaurantId;
  String restaurantName;
  String restaurantProfileImage;
  String restaurantImage;
  String cuisines;
  int totalRating;
  int totalReview;
  String veg;
  String pickup;
  String tableBooking;
  int noOfSeats;
  String fullTime;
  String openingTime;
  String latitude;
  String longitude;
  String address;
  String frenchAddress;
  String closingTime;
  String estimatedPreparingTime;
  bool busyStatus;
  // List<PopularItems> popularItems;
  List<FeaturedItems> featuredItems;
  // List<AllData> allData;
  int totalCartItem;

  DetailsModel(
      {this.deliveryFee,
      this.restaurantId,
      this.restaurantName,
      this.restaurantProfileImage,
      this.restaurantImage,
      this.cuisines,
      this.totalRating,
      this.totalReview,
      this.veg,
      this.pickup,
      this.tableBooking,
      this.noOfSeats,
      this.fullTime,
      this.openingTime,
      this.latitude,
      this.longitude,
      this.address,
      this.frenchAddress,
      this.closingTime,
      this.estimatedPreparingTime,
      this.busyStatus,
      // this.popularItems,
      this.featuredItems,
      // this.allData,
      this.totalCartItem});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    deliveryFee = json['delivery_fee'];
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantProfileImage = json['restaurant_profile_image'];
    restaurantImage = json['restaurant_image'];
    cuisines = json['cuisines'];
    totalRating = json['total_rating'];
    totalReview = json['total_review'];
    veg = json['veg'];
    pickup = json['pickup'];
    tableBooking = json['table_booking'];
    noOfSeats = json['no_of_seats'];
    fullTime = json['full_time'];
    openingTime = json['opening_time'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    frenchAddress = json['french_address'];
    closingTime = json['closing_time'];
    estimatedPreparingTime = json['estimated_preparing_time'];
    busyStatus = json['busy_status'];
    // if (json['popular_items'] != null) {
    //   popularItems = new List<PopularItems>();
    //   json['popular_items'].forEach((v) {
    //     popularItems.add(new PopularItems.fromJson(v));
    //   });
    // }
    if (json['featured_items'] != null) {
      featuredItems = new List<FeaturedItems>();
      json['featured_items'].forEach((v) {
        featuredItems.add(new FeaturedItems.fromJson(v));
      });
    }
    // if (json['all_data'] != null) {
    //   allData = new List<AllData>();
    //   json['all_data'].forEach((v) {
    //     allData.add(new AllData.fromJson(v));
    //   });
    // }
    totalCartItem = json['total_cart_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_fee'] = this.deliveryFee;
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_profile_image'] = this.restaurantProfileImage;
    data['restaurant_image'] = this.restaurantImage;
    data['cuisines'] = this.cuisines;
    data['total_rating'] = this.totalRating;
    data['total_review'] = this.totalReview;
    data['veg'] = this.veg;
    data['pickup'] = this.pickup;
    data['table_booking'] = this.tableBooking;
    data['no_of_seats'] = this.noOfSeats;
    data['full_time'] = this.fullTime;
    data['opening_time'] = this.openingTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['french_address'] = this.frenchAddress;
    data['closing_time'] = this.closingTime;
    data['estimated_preparing_time'] = this.estimatedPreparingTime;
    data['busy_status'] = this.busyStatus;
    // if (this.popularItems != null) {
    //   data['popular_items'] = this.popularItems.map((v) => v.toJson()).toList();
    // }
    if (this.featuredItems != null) {
      data['featured_items'] =
          this.featuredItems.map((v) => v.toJson()).toList();
    }
    // if (this.allData != null) {
    //   data['all_data'] = this.allData.map((v) => v.toJson()).toList();
    // }
    data['total_cart_item'] = this.totalCartItem;
    return data;
  }

  static Future<DetailsModel> getDetail() async {
    Map<String, dynamic> res = await ServiceApi().get(
      Endpoints.getDetail(),
    );
    DetailsModel result = DetailsModel.fromJson(res);

    return result;
  }
}

class PopularItems {
  int id;
  int restaurantId;
  int parentCuisineId;
  int cuisineId;
  String name;
  String frenchName;
  String description;
  String frenchDescription;
  String image;
  String price;
  int offerPrice;
  String approxPrepTime;
  String inOffer;
  String pureVeg;
  String approved;
  String featured;
  String status;
  String createdAt;
  String updatedAt;
  String cuisineName;
  String restaurantName;
  int avgRatings;
  int totalRating;
  List<ItemCategories> itemCategories;

  PopularItems(
      {this.id,
      this.restaurantId,
      this.parentCuisineId,
      this.cuisineId,
      this.name,
      this.frenchName,
      this.description,
      this.frenchDescription,
      this.image,
      this.price,
      this.offerPrice,
      this.approxPrepTime,
      this.inOffer,
      this.pureVeg,
      this.approved,
      this.featured,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.cuisineName,
      this.restaurantName,
      this.avgRatings,
      this.totalRating,
      this.itemCategories});

  PopularItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    parentCuisineId = json['parent_cuisine_id'];
    cuisineId = json['cuisine_id'];
    name = json['name'];
    frenchName = json['french_name'];
    description = json['description'];
    frenchDescription = json['french_description'];
    image = json['image'];
    price = json['price'];
    offerPrice = json['offer_price'];
    approxPrepTime = json['approx_prep_time'];
    inOffer = json['in_offer'];
    pureVeg = json['pure_veg'];
    approved = json['approved'];
    featured = json['featured'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cuisineName = json['cuisine_name'];
    restaurantName = json['restaurant_name'];
    avgRatings = json['avg_ratings'];
    totalRating = json['total_rating'];
    if (json['item_categories'] != null) {
      itemCategories = new List<ItemCategories>();
      json['item_categories'].forEach((v) {
        itemCategories.add(new ItemCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['parent_cuisine_id'] = this.parentCuisineId;
    data['cuisine_id'] = this.cuisineId;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['description'] = this.description;
    data['french_description'] = this.frenchDescription;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['approx_prep_time'] = this.approxPrepTime;
    data['in_offer'] = this.inOffer;
    data['pure_veg'] = this.pureVeg;
    data['approved'] = this.approved;
    data['featured'] = this.featured;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cuisine_name'] = this.cuisineName;
    data['restaurant_name'] = this.restaurantName;
    data['avg_ratings'] = this.avgRatings;
    data['total_rating'] = this.totalRating;
    if (this.itemCategories != null) {
      data['item_categories'] =
          this.itemCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemCategories {
  int id;
  int itemId;
  String name;
  String frenchName;
  String selection;
  int min;
  int max;
  String required;
  String status;
  String createdAt;
  String updatedAt;
  List<ItemSubCategory> itemSubCategory;

  ItemCategories(
      {this.id,
      this.itemId,
      this.name,
      this.frenchName,
      this.selection,
      this.min,
      this.max,
      this.required,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.itemSubCategory});

  ItemCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    name = json['name'];
    frenchName = json['french_name'];
    selection = json['selection'];
    min = json['min'];
    max = json['max'];
    required = json['required'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['item_sub_category'] != null) {
      itemSubCategory = new List<ItemSubCategory>();
      json['item_sub_category'].forEach((v) {
        itemSubCategory.add(new ItemSubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['selection'] = this.selection;
    data['min'] = this.min;
    data['max'] = this.max;
    data['required'] = this.required;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itemSubCategory != null) {
      data['item_sub_category'] =
          this.itemSubCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemSubCategory {
  int id;
  int itemCatId;
  String name;
  String frenchName;
  String addOnPrice;
  int min;
  int max;
  String required;
  String status;
  String createdAt;
  String updatedAt;
  List<ItemSubSubCategory> itemSubSubCategory;

  ItemSubCategory(
      {this.id,
      this.itemCatId,
      this.name,
      this.frenchName,
      this.addOnPrice,
      this.min,
      this.max,
      this.required,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.itemSubSubCategory});

  ItemSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemCatId = json['item_cat_id'];
    name = json['name'];
    frenchName = json['french_name'];
    addOnPrice = json['add_on_price'];
    min = json['min'];
    max = json['max'];
    required = json['required'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['item_sub_sub_category'] != null) {
      itemSubSubCategory = new List<ItemSubSubCategory>();
      json['item_sub_sub_category'].forEach((v) {
        itemSubSubCategory.add(new ItemSubSubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_cat_id'] = this.itemCatId;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['add_on_price'] = this.addOnPrice;
    data['min'] = this.min;
    data['max'] = this.max;
    data['required'] = this.required;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itemSubSubCategory != null) {
      data['item_sub_sub_category'] =
          this.itemSubSubCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemSubSubCategory {
  int id;
  int itemSubCatId;
  String name;
  String frenchName;
  String addOnPrice;
  int min;
  int max;
  String required;
  String status;
  String createdAt;
  String updatedAt;

  ItemSubSubCategory(
      {this.id,
      this.itemSubCatId,
      this.name,
      this.frenchName,
      this.addOnPrice,
      this.min,
      this.max,
      this.required,
      this.status,
      this.createdAt,
      this.updatedAt});

  ItemSubSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemSubCatId = json['item_sub_cat_id'];
    name = json['name'];
    frenchName = json['french_name'];
    addOnPrice = json['add_on_price'];
    min = json['min'];
    max = json['max'];
    required = json['required'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_sub_cat_id'] = this.itemSubCatId;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['add_on_price'] = this.addOnPrice;
    data['min'] = this.min;
    data['max'] = this.max;
    data['required'] = this.required;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FeaturedItems {
  int id;
  int restaurantId;
  int parentCuisineId;
  int cuisineId;
  String name;
  String frenchName;
  String description;
  String frenchDescription;
  String image;
  String price;
  dynamic offerPrice;
  String approxPrepTime;
  String inOffer;
  String pureVeg;
  String approved;
  String featured;
  String status;
  String createdAt;
  String updatedAt;
  String cuisineName;
  // List<ItemRemoveables> itemRemoveables;
  String restaurantName;
  // List<ItemCategories> itemCategories;
  dynamic avgRatings;
  dynamic totalRating;

  FeaturedItems(
      {this.id,
      this.restaurantId,
      this.parentCuisineId,
      this.cuisineId,
      this.name,
      this.frenchName,
      this.description,
      this.frenchDescription,
      this.image,
      this.price,
      this.offerPrice,
      this.approxPrepTime,
      this.inOffer,
      this.pureVeg,
      this.approved,
      this.featured,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.cuisineName,
      // this.itemRemoveables,
      this.restaurantName,
      // this.itemCategories,
      this.avgRatings,
      this.totalRating});

  FeaturedItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    parentCuisineId = json['parent_cuisine_id'];
    cuisineId = json['cuisine_id'];
    name = json['name'];
    frenchName = json['french_name'];
    description = json['description'];
    frenchDescription = json['french_description'];
    image = json['image'];
    price = json['price'];
    offerPrice = json['offer_price'];
    approxPrepTime = json['approx_prep_time'];
    inOffer = json['in_offer'];
    pureVeg = json['pure_veg'];
    approved = json['approved'];
    featured = json['featured'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cuisineName = json['cuisine_name'];
    // if (json['item_removeables'] != null) {
    //   itemRemoveables = new List<ItemRemoveables>();
    //   json['item_removeables'].forEach((v) {
    //     itemRemoveables.add(new ItemRemoveables.fromJson(v));
    //   });
    // }
    restaurantName = json['restaurant_name'];
    // if (json['item_categories'] != null) {
    //   itemCategories = new List<ItemCategories>();
    //   json['item_categories'].forEach((v) {
    //     itemCategories.add(new ItemCategories.fromJson(v));
    //   });
    // }
    avgRatings = json['avg_ratings'];
    totalRating = json['total_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['parent_cuisine_id'] = this.parentCuisineId;
    data['cuisine_id'] = this.cuisineId;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['description'] = this.description;
    data['french_description'] = this.frenchDescription;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['approx_prep_time'] = this.approxPrepTime;
    data['in_offer'] = this.inOffer;
    data['pure_veg'] = this.pureVeg;
    data['approved'] = this.approved;
    data['featured'] = this.featured;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cuisine_name'] = this.cuisineName;
    // if (this.itemRemoveables != null) {
    //   data['item_removeables'] =
    //       this.itemRemoveables.map((v) => v.toJson()).toList();
    // }
    data['restaurant_name'] = this.restaurantName;
    // if (this.itemCategories != null) {
    //   data['item_categories'] =
    //       this.itemCategories.map((v) => v.toJson()).toList();
    // }
    data['avg_ratings'] = this.avgRatings;
    data['total_rating'] = this.totalRating;
    return data;
  }
}

class ItemRemoveables {
  int id;
  int itemId;
  String name;
  String frenchName;
  String status;
  String createdAt;
  String updatedAt;

  ItemRemoveables(
      {this.id,
      this.itemId,
      this.name,
      this.frenchName,
      this.status,
      this.createdAt,
      this.updatedAt});

  ItemRemoveables.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    name = json['name'];
    frenchName = json['french_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['name'] = this.name;
    data['french_name'] = this.frenchName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AllData {
  String categoryName;
  Null startDate;
  Null endDate;
  String startTime;
  String endTime;
  Null specialDay;
  List<Data> data;

  AllData(
      {this.categoryName,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.specialDay,
      this.data});

  AllData.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    specialDay = json['special_day'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['special_day'] = this.specialDay;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  int itemsCount;

  Data(
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
      this.itemsCount});

  Data.fromJson(Map<String, dynamic> json) {
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
    itemsCount = json['items_count'];
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
    data['items_count'] = this.itemsCount;
    return data;
  }
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Estate {
  String? title;
  String? subtitle;
  double? price;
  String? image;
  Estate({
    this.title,
    this.subtitle,
    this.price,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'image': image,
    };
  }

  factory Estate.fromMap(Map<String, dynamic> map) {
    return Estate(
      title: map['title'] != null ? map['title'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estate.fromJson(String source) =>
      Estate.fromMap(json.decode(source) as Map<String, dynamic>);
}


// String category;
  // String description;
  // String area;
  // String city;
  // String district;
  // String detailedAddress;
  // String direction;
  // String advancedWarranty;
  // String furnitureQuality;
  // String decorQuality;
  // String refundableWith;
  // String image;
  // String video;
  // bool petsAllowed;
  // bool hasLift;
  // bool hasFreshWater;
  // bool hasWaterHeather;
  // bool hasWifi;
  // bool hasPotagaz;
  // bool hasCookerStove;
  // bool hasClothesWasher;
  // bool hasTableWareAndKitchenWare;
  // bool isNegotiable;
  // double propertyPrice;
  // double carParkingPrice;
  // double wifiPrice;
  // double insurancePrice;
  // int roomsNumber;
  // int apartmentNumber;
  // int floorNumber;
  // int bedsNumber;
  // int carParkingNumber;
  // int airConditioningNumber;
  // int tvNumber;
  // int standFanNumber;
  // int fixedFanNumber;
  // int windowNumber;
  // int balconyNumber;
  // DateTime refundableCheckIn;
  // DateTime refundableCheckOut;
// filter model

// {
//     String name,
//     String phone,
//     String filterByStatus,
//     String filterByCategory,
//     String filterByPlan,
//     String city,
//     String district,
//     String review,
//     bool priceNegotiable,
//     bool fixedFans,
//     bool airConditioning,
//     bool petsAllowed,
//     bool tableWareAndKitchenWare,
//     bool standFans,
//     bool potagaz,
//     bool tv,
//     bool wifi,
//     bool showerHeater,
//     bool freshWater,
//     bool clothesWasher,
//     bool elevator,
//     DateTime checkIn,
//     DateTime checkOut,
//     int adults,
//     int children,
//     int room,
//     double filterByPrice,
//     double orderedByPrice,
//   }

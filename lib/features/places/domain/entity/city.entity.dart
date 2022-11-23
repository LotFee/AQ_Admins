// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class City {
  final String name;
  final String image;
  final String location;
  City({
    required this.name,
    required this.image,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'location': location,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      name: map['name'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);
}

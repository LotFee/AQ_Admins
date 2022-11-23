import 'dart:convert';

class District {
  final String city;
  final String name;
  final String image;
  final String location;
  District({
    required this.city,
    required this.name,
    required this.image,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'name': name,
      'image': image,
      'location': location,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      city: map['city'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);
}

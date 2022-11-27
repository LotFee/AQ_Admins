import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  String? id;
  String? image;
  String? apartmentTitle;
  String? apartmentSubtitle;
  String? body;
  String? bookerImage;
  String? bookerName;

  Question({
    this.id,
    this.image,
    this.apartmentTitle,
    this.apartmentSubtitle,
    this.body,
    this.bookerImage,
    this.bookerName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'apartmentTitle': apartmentTitle,
      'apartmentSubtitle': apartmentSubtitle,
      'body': body,
      'bookerImage': bookerImage,
      'bookerName': bookerName,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] != null ? map['id'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      apartmentTitle: map['apartmentTitle'] != null
          ? map['apartmentTitle'] as String
          : null,
      apartmentSubtitle: map['apartmentSubtitle'] != null
          ? map['apartmentSubtitle'] as String
          : null,
      body: map['body'] != null ? map['body'] as String : null,
      bookerImage:
          map['bookerImage'] != null ? map['bookerImage'] as String : null,
      bookerName:
          map['bookerName'] != null ? map['bookerName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}

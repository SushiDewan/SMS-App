import 'dart:convert';

SchoolIdModel schoolIdModelFromJson(String str) => SchoolIdModel.fromJson(json.decode(str));

String schoolIdModelToJson(SchoolIdModel data) => json.encode(data.toJson());

class SchoolIdModel {
    SchoolIdModel({
        this.school,
    });

    String school;

    factory SchoolIdModel.fromJson(Map<String, dynamic> json) => SchoolIdModel(
        school: json["school"],
    );

    Map<String, dynamic> toJson() => {
        "school": school,
    };
}
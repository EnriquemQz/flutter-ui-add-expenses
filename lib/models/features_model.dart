import 'dart:convert';

FeaturesModel featuresModelFromJson(String str) => FeaturesModel.fromJson(json.decode(str));

String featuresModelToJson(FeaturesModel data) => json.encode(data.toJson());

class FeaturesModel {
    FeaturesModel({
        this.id,
        this.category = '',
        this.icon = '57664',
        this.color = '#4287f5',
    });

    int id;
    String category;
    String icon;
    String color;

    factory FeaturesModel.fromJson(Map<String, dynamic> json) => FeaturesModel(
        id: json["id"],
        category: json["category"],
        icon: json["icon"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "icon": icon,
        "color": color,
    };
}

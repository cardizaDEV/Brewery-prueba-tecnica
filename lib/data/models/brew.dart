import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Brew {
  int? id;
  String? name;
  String? tagline;
  String? first_brewed;
  String? description;
  String? image_url;
  dynamic abv;
  dynamic ibu;
  dynamic target_fg;
  dynamic target_og; 
  dynamic ebc;
  dynamic srm;
  dynamic ph;
  dynamic attenuation_level;
  Map<String, dynamic>? volume;
  Map<String, dynamic>? boil_volume;
  Map<String, dynamic>? method;
  Map<String, dynamic>? ingredients;
  List<dynamic>? food_pairing;
  String? brewer_tips;
  String? contributed_by;
  Brew(
      {this.id,
      this.name,
      this.tagline,
      this.first_brewed,
      this.description,
      this.image_url,
      this.abv,
      this.ibu,
      this.target_fg,
      this.target_og,
      this.ebc,
      this.srm,
      this.ph,
      this.attenuation_level,
      this.volume,
      this.boil_volume,
      this.method,
      this.ingredients,
      this.food_pairing,
      this.brewer_tips,
      this.contributed_by});

  factory Brew.fromJson(Map<String, dynamic> json) {
    return Brew(
        id: json['id'],
        name: json['name'],
        tagline: json['tagline'],
        first_brewed: json['first_brewed'],
        description: json['description'],
        image_url: json['image_url'],
        abv: json['abv'],
        ibu: json['ibu'],
        target_fg: json['target_fg'],
        target_og: json['target_og'],
        ebc: json['ebc'],
        srm: json['srm'],
        ph: json['ph'],
        attenuation_level: json['attenuation_level'],
        volume: json['volume'],
        boil_volume: json['boil_volume'],
        method: json['method'],
        ingredients: json['ingredients'],
        food_pairing: json['food_pairing'],
        brewer_tips: json['brewer_tips'],
        contributed_by: json['contributed_by']);
  }
}

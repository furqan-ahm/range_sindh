import 'package:flutter/material.dart';


class RecordModel {
  int index;
  String docId;
  String articleName;
  double fareCost;
  double fabricCost;
  double workingCost;
  double split;
  double sellingCost;

  RecordModel({
    required this.index,
    required this.docId,
    required this.articleName,
    required this.fareCost,
    required this.fabricCost,
    required this.workingCost,
    required this.split,
    required this.sellingCost,
  });


  

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      index: json['index'],
      docId: json['docId'],
      articleName: json['articleName'],
      fareCost: json['fareCost'],
      fabricCost: json['fabricCost'],
      workingCost: json['workingCost'],
      split: json['split'],
      sellingCost: json['sellingCost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'docId': docId,
      'articleName': articleName,
      'fareCost': fareCost,
      'fabricCost': fabricCost,
      'workingCost': workingCost,
      'split': split,
      'sellingCost': sellingCost,
    };
  }
}
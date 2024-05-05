import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class RecordModel {
  int index;

  String articleName;
  double fareCost;
  double fabricCost;
  double workingCost;
  double sellingPrice;
  double discount;
  double soldPrice;
  DocumentSnapshot? doc;


  DateTime? timestamp;

  RecordModel({
    required this.index,
    required this.articleName,
    required this.fareCost,
    required this.fabricCost,
    required this.workingCost,
    required this.sellingPrice,
    this.timestamp,
     this.discount=0,
    required this.soldPrice,
  });

  double get totalExpenseWithFabric=>fareCost+fabricCost+workingCost;
  double get totalExpenseWithioutFabric=>fareCost+fabricCost+workingCost;
  double get sellingPriceWithoutFabric=>sellingPrice-fabricCost;


  double get profitEarned=>(soldPrice-totalExpenseWithFabric);

  factory RecordModel.fromJson(Map<String, dynamic> json,) {
    return RecordModel(
      index: json['index'],
      articleName: json['articleName'],
      fareCost: json['fareCost'],
      fabricCost: json['fabricCost'],
      workingCost: json['workingCost'],
      discount: json['discount'],
      sellingPrice: json['sellingPrice'],
      timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
      soldPrice: json['soldPrice'],
    );
  }
  factory RecordModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return RecordModel.fromJson(doc.data() as Map<String, dynamic>)..doc=doc;
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'articleName': articleName,
      'fareCost': fareCost,
      'fabricCost': fabricCost,
      'workingCost': workingCost,
      'discount':discount,
      'sellingCost': sellingPrice,
      'soldPrice': soldPrice,
    };
  }
}


 List<RecordModel> dummyData = [
    RecordModel(
      index: 1,
      articleName: 'Article 1',
      fareCost: 10.0,
      fabricCost: 20.0,
      workingCost: 15.0,
      soldPrice: 24,
      sellingPrice: 50.0,
    ),
    RecordModel(
      index: 2,
      articleName: 'Article 2',
      fareCost: 12.0,
      fabricCost: 25.0,
      workingCost: 18.0,
      soldPrice: 24,
      sellingPrice: 55.0,
    ),
    // Add more dummy data as needed
  ];
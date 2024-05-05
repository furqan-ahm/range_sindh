import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_sindh/models/record_model.dart';
import 'package:range_sindh/services/firestore_service.dart';

class AddRecordController extends GetxController {
  TextEditingController articleName =
      TextEditingController(text: 'New Article');
  TextEditingController fabricCost = TextEditingController(text: '0');
  TextEditingController fareCost = TextEditingController(text: '0');
  TextEditingController workingCost = TextEditingController(text: '0');
  TextEditingController profitMargin = TextEditingController(text: '50');
  TextEditingController sellingPrice = TextEditingController(text: '0');
  TextEditingController discountPrice = TextEditingController(text: '0');

  RxDouble totalExpense = (0.0).obs;

  RxDouble finalSellingPrice = (0.0).obs;

  double get profitEarned {
    return finalSellingPrice.value - totalExpense.value;
  }

  double get discountAmount {
    var selling =
        sellingPrice.text.isEmpty ? .0 : double.parse(sellingPrice.text);
    return selling - finalSellingPrice.value;
  }

  int get finalProfitPercent {
    var profitPerc = profitEarned / totalExpense.value;
    return profitPerc.isNaN ? 0 : (profitPerc * 100).toInt();
  }

  calculateStuff() {
    var fabric = fabricCost.text.isEmpty ? 0.0 : double.parse(fabricCost.text);
    var fare = fareCost.text.isEmpty ? 0.0 : double.parse(fareCost.text);
    var working =
        workingCost.text.isEmpty ? 0.0 : double.parse(workingCost.text);
    var discount =
        discountPrice.text.isEmpty ? 0.0 : double.parse(discountPrice.text);

    totalExpense.value = fabric + fare + working;

    var profit =
        profitMargin.text.isEmpty ? 0.0 : double.parse(profitMargin.text);

    sellingPrice.text =
        ((profit * totalExpense.value / 100) + totalExpense.value)
            .toStringAsFixed(2);

    finalSellingPrice.value = double.parse(sellingPrice.text) -
        (discount / 100) * double.parse(sellingPrice.text);
    update();
  }

  calculateProfit() {
    var selling =
        sellingPrice.text.isEmpty ? .0 : double.parse(sellingPrice.text);
    profitMargin.text =
        (((selling - totalExpense.value) / totalExpense.value) * 100)
            .toStringAsFixed(2);

    var discount =
        discountPrice.text.isEmpty ? 0.0 : double.parse(discountPrice.text);
    finalSellingPrice.value = double.parse(sellingPrice.text) -
        (discount / 100) * double.parse(sellingPrice.text);

    update();
  }

  Future addSale() async {
    try {
      var fabric =
          fabricCost.text.isEmpty ? 0.0 : double.parse(fabricCost.text);
      var fare = fareCost.text.isEmpty ? 0.0 : double.parse(fareCost.text);
      var working =
          workingCost.text.isEmpty ? 0.0 : double.parse(workingCost.text);

      var discount =
          discountPrice.text.isEmpty ? 0.0 : double.parse(discountPrice.text);
      var selling =
          sellingPrice.text.isEmpty ? .0 : double.parse(sellingPrice.text);

      await FirestoreService().createRecord({
        'articleName': articleName.text,
        'fareCost': fare,
        'fabricCost': fabric,
        'workingCost': working,
        'sellingPrice': selling,
        'discount': discount,
        'soldPrice': finalSellingPrice.value,
        'timestamp':Timestamp.fromDate(DateTime.now())
      });
      Get.back();
      
    } on Exception catch (e) {
      print('Failed to Upload $e');
    }
  }
}

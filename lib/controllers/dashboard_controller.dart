import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:range_sindh/models/record_model.dart';
import 'package:range_sindh/services/firestore_service.dart';

class DashboardController extends GetxController {
 

  Offset mousePosition=const Offset(0, 0);
  RxList<RecordModel> salesRecord=<RecordModel>[].obs;

  Stream<List<RecordModel>> salesRecords=FirestoreService().getSaleRecordsStream();

  StreamSubscription? sub;
 @override
  void onInit() {
    salesRecords.listen((event) {
      salesRecord.value=event;
    });
    super.onInit();
  }



  delete(RecordModel record){
    record.doc!.reference.delete();
    Get.back();
  }

  @override
  void onClose() {
    sub?.cancel();
    super.onClose();
  }



}

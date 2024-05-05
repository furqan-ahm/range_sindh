import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:range_sindh/models/record_model.dart';

class FirestoreService extends GetxService {
  FirestoreService._();

  static late FirestoreService _privateInstance;

  factory FirestoreService() {
    _privateInstance = FirestoreService._();
    return _privateInstance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // needs indexing for proper ordering
  Stream<List<RecordModel>> getSaleRecordsStream() {
    return _firestore
        .collection('saleRecords')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => RecordModel.fromDocumentSnapshot(
                  e,
                ))
            .toList());
  }

  
   Future createRecord(Map<String, dynamic> data) async {
    //creating unique id that stays same when either of users start the convo
   var length=(await _firestore.collection('saleRecords').count().get()).count??0;
    var doc=await _firestore.collection('saleRecords').add({
      ...data,
      'index':length+1
    });
  }




  Future<List<RecordModel>> getSaleRecords({DocumentSnapshot? after}) async {
    final query = _firestore
        .collection('saleRecords')
        .orderBy('publishedAt', descending: true)
        .limit(10);
  
    final querySnapshot = after != null
        ? await query.startAfterDocument(after).get()
        : await query.get();

    return querySnapshot.docs.map(RecordModel.fromDocumentSnapshot).toList();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vent/app/data/models/supplier_model.dart';

class SupplierRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Supplier>> getSuppliers() {
    return _firestore.collection('suppliers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Supplier.fromFirestore(doc)).toList();
    });
  }

  Future<void> addSupplier(Supplier supplier) async {
    await _firestore.collection('suppliers').add(supplier.toFirestore());
  }

  Future<void> updateSupplier(Supplier supplier) async {
    await _firestore.collection('suppliers').doc(supplier.id).update(supplier.toFirestore());
  }

  Future<void> deleteSupplier(String supplierId) async {
    await _firestore.collection('suppliers').doc(supplierId).delete();
  }
}

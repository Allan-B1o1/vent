import 'package:cloud_firestore/cloud_firestore.dart';

class Supplier {
  String? id;
  String name;
  String contactPerson;
  String email;
  String phone;
  String address;
  bool isPreferred;
  DateTime createdAt;
  DateTime updatedAt;

  Supplier({
    this.id,
    required this.name,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
    this.isPreferred = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Supplier.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Supplier(
      id: doc.id,
      name: data['name'] ?? '',
      contactPerson: data['contactPerson'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      address: data['address'] ?? '',
      isPreferred: data['isPreferred'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'contactPerson': contactPerson,
      'email': email,
      'phone': phone,
      'address': address,
      'isPreferred': isPreferred,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

extension SupplierCopyWith on Supplier {
  Supplier copyWith({
    String? id,
    String? name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    bool? isPreferred,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Supplier(
      id: id ?? this.id,
      name: name ?? this.name,
      contactPerson: contactPerson ?? this.contactPerson,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      isPreferred: isPreferred ?? this.isPreferred,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
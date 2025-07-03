import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String name;
  String description;
  String category;
  double price;
  int stockQuantity;
  String imageUrl;
  String supplierId;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.stockQuantity,
    required this.imageUrl,
    required this.supplierId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      stockQuantity: (data['stockQuantity'] ?? 0).toInt(),
      imageUrl: data['imageUrl'] ?? '',
      supplierId: data['supplierId'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'stockQuantity': stockQuantity,
      'imageUrl': imageUrl,
      'supplierId': supplierId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

extension ProductCopyWith on Product {
  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    double? price,
    int? stockQuantity,
    String? imageUrl,
    String? supplierId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      imageUrl: imageUrl ?? this.imageUrl,
      supplierId: supplierId ?? this.supplierId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
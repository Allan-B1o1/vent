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
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // Factory constructor for creating a Product from a map (e.g., for mock data)
  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      stockQuantity: (data['stockQuantity'] ?? 0).toInt(),
      imageUrl: data['imageUrl'] ?? '',
      supplierId: data['supplierId'] ?? '',
      createdAt: data['createdAt'] is String
          ? DateTime.parse(data['createdAt'])
          : data['createdAt'],
      updatedAt: data['updatedAt'] is String
          ? DateTime.parse(data['updatedAt'])
          : data['updatedAt'],
    );
  }

  // Method to convert Product to a map (e.g., for mock data)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'stockQuantity': stockQuantity,
      'imageUrl': imageUrl,
      'supplierId': supplierId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
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

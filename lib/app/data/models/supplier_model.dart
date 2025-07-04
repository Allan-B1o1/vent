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
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // Factory constructor for creating a Supplier from a map (e.g., for mock data)
  factory Supplier.fromMap(Map<String, dynamic> data) {
    return Supplier(
      id: data['id'],
      name: data['name'] ?? '',
      contactPerson: data['contactPerson'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      address: data['address'] ?? '',
      isPreferred: data['isPreferred'] ?? false,
      createdAt: data['createdAt'] is String
          ? DateTime.parse(data['createdAt'])
          : data['createdAt'],
      updatedAt: data['updatedAt'] is String
          ? DateTime.parse(data['updatedAt'])
          : data['updatedAt'],
    );
  }

  // Method to convert Supplier to a map (e.g., for mock data)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contactPerson': contactPerson,
      'email': email,
      'phone': phone,
      'address': address,
      'isPreferred': isPreferred,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
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

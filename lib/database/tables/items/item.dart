import 'dart:convert';

import 'package:ui/database/enums/category.dart' show Category;
import 'package:ui/database/enums/source.dart' show Source;
import 'package:ui/database/enums/status.dart' show Status;

class ItemTable {
  static const tableName = 'items';

  static const id = 'item_id';
  static const name = 'name';
  static const purchaseDate = 'purchase_date';
  static const expiryDate = 'expiry_date';
  static const addedDate = 'added_date';
  static const price = 'price';
  static const location = 'location';
  static const notes = 'notes';
  static const source = 'source';
  static const category = 'category';
  static const barcode = 'barcode';
  static const parentItemId = 'parent_item_id';
  static const lastUpdatedDate = 'last_updated_date';
  static const status = 'status';
  static const urlLink = 'url_link';
}

class Item {
  /// semasa kemasukan data ke database, id boleh diisi dengan data yang salah seperti empty string
  final String id;
  final String name;
  final DateTime? purchaseDate;
  final DateTime? expiryDate;
  final double? price;
  final String? location;
  final String? notes;
  final Source? source;
  final Category? category;
  final DateTime? addedDate;
  final String? barcode;
  final String? parentItemId;
  final DateTime? lastUpdatedDate;
  final Status? status;
  final String? urlLink;

  Item({
    required this.id,
    required this.name,
    this.purchaseDate,
    this.expiryDate,
    this.price,
    this.location,
    this.notes,
    this.source,
    this.category,
    this.addedDate,
    this.barcode,
    this.parentItemId,
    this.lastUpdatedDate,
    this.status,
    this.urlLink,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json[ItemTable.id] as String,
      name: json[ItemTable.name] as String,
      purchaseDate:
          json[ItemTable.purchaseDate] != null
              ? DateTime.parse(json[ItemTable.purchaseDate] as String)
              : null,
      expiryDate:
          json[ItemTable.expiryDate] != null
              ? DateTime.parse(json[ItemTable.expiryDate] as String)
              : null,
      addedDate:
          json[ItemTable.addedDate] != null
              ? DateTime.parse(json[ItemTable.addedDate] as String)
              : null,
      lastUpdatedDate:
          json[ItemTable.lastUpdatedDate] != null
              ? DateTime.parse(json[ItemTable.lastUpdatedDate].toString())
              : null,
      price:
          json[ItemTable.price] != null
              ? (json[ItemTable.price] as num).toDouble()
              : null,
      location: json[ItemTable.location] as String?,
      notes: json[ItemTable.notes] as String?,
      source:
          json[ItemTable.source] != null
              ? Source.fromPostgres(json[ItemTable.source] as String)
              : null,
      category:
          json[ItemTable.category] != null
              ? Category.fromPostgres(json[ItemTable.category] as String)
              : null,
      barcode: json[ItemTable.barcode] as String?,
      parentItemId: json[ItemTable.parentItemId] as String?,
      status:
          json[ItemTable.status] != null
              ? Status.fromPostgres(json[ItemTable.status] as String)
              : null,
      urlLink: json[ItemTable.urlLink] as String?,
    );
  }
}

extension ItemUtility on Item {
  Map<String, dynamic> toMap({bool forInsert = false}) {
    final map = {
      ItemTable.id: id,
      ItemTable.name: name,
      ItemTable.purchaseDate: purchaseDate?.toIso8601String(),
      ItemTable.expiryDate: expiryDate?.toIso8601String(),
      ItemTable.price: price,
      ItemTable.location: location,
      ItemTable.notes: notes,
      ItemTable.source: source?.toPostgres(),
      ItemTable.category: category?.toPostgres(),
      ItemTable.barcode: barcode,
      ItemTable.parentItemId: parentItemId,
      ItemTable.lastUpdatedDate: DateTime.now().toIso8601String(),
      ItemTable.status: status?.toPostgres(),
      ItemTable.urlLink: urlLink,
    };

    if (forInsert) {
      map[ItemTable.addedDate] = DateTime.now().toIso8601String();

      map
        ..remove(ItemTable.id)
        ..remove(ItemTable.addedDate);
    }

    return map;
  }

  String toJsonString() => jsonEncode(toMap());

  Item copyWith({
    String? id,
    String? name,
    DateTime? purchaseDate,
    DateTime? expiryDate,
    DateTime? addedDate,
    double? price,
    String? location,
    String? notes,
    Source? source,
    Category? category,
    String? barcode,
    String? parentItemId,
    DateTime? lastUpdatedDate,
    Status? status,
    String? urlLink,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expiryDate: expiryDate ?? this.expiryDate,
      addedDate: addedDate ?? this.addedDate,
      price: price ?? this.price,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      source: source ?? this.source,
      category: category ?? this.category,
      barcode: barcode ?? this.barcode,
      parentItemId: parentItemId ?? this.parentItemId,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
      status: status ?? this.status,
      urlLink: urlLink ?? this.urlLink,
    );
  }
}

import 'dart:convert';

class MaintenanceLogTable {
  static const String tableName = 'maintenance_logs';

  static const String id = 'log_id';
  static const String itemId = 'item_id';
  static const String date = 'date';
  static const String description = 'description';
  static const String cost = 'cost';
}

class MaintenanceLog {
  MaintenanceLog({
    required this.id,
    required this.itemId,
    this.date,
    this.description,
    this.cost,
  });

  factory MaintenanceLog.fromJson(Map<String, dynamic> json) {
    return MaintenanceLog(
      id: json[MaintenanceLogTable.id] as String,
      itemId: json[MaintenanceLogTable.itemId] as String,
      date:
          json[MaintenanceLogTable.date] != null
              ? DateTime.parse(json[MaintenanceLogTable.date] as String)
              : null,
      description: json[MaintenanceLogTable.description] as String?,
      cost:
          json[MaintenanceLogTable.cost] != null
              ? json[MaintenanceLogTable.cost] as double
              : null, // Menggunakan null safety operator
    );
  }

  final String id;
  final String itemId;
  final DateTime? date;
  final String? description;
  final double? cost;
}

extension MaintenanceLogUtility on MaintenanceLog {
  Map<String, dynamic> toMap({bool forInsert = false}) {
    final map = <String, dynamic>{
      MaintenanceLogTable.id: id,
      MaintenanceLogTable.itemId: itemId,
      MaintenanceLogTable.date: date?.toIso8601String(),
      MaintenanceLogTable.description: description,
      MaintenanceLogTable.cost: cost,
    };

    if (forInsert) {
      map.remove(MaintenanceLogTable.id);
    }

    return map;
  }

  String toJsonString() => jsonEncode(toMap());

  MaintenanceLog copyWith({
    String? id,
    String? itemId,
    DateTime? date,
    String? description,
    double? cost,
  }) {
    return MaintenanceLog(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      date: date ?? this.date,
      description: description ?? this.description,
      cost: cost ?? this.cost,
    );
  }
}

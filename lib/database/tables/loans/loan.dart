import 'dart:convert' show jsonEncode;

class LoanTable {
  static const String tableName = 'loans';

  static const String id = 'loan_id';
  static const String itemId = 'item_id';
  static const String borrowerName = 'borrower_name';
  static const String loanDate = 'loan_date';
  static const String returnDate = 'return_date';
  static const String status = 'status';
}

class Loan {
  Loan({
    required this.id,
    required this.itemId,
    required this.borrowerName,
    this.loanDate,
    this.returnDate,
    this.status,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json[LoanTable.id] as String,
      itemId: json[LoanTable.itemId] as String,
      borrowerName: json[LoanTable.borrowerName] as String,
      loanDate:
          json[LoanTable.loanDate] != null
              ? DateTime.parse(json[LoanTable.loanDate] as String)
              : null,
      returnDate:
          json[LoanTable.returnDate] != null
              ? DateTime.parse(json[LoanTable.returnDate] as String)
              : null,
      status: json[LoanTable.status] as bool?,
    );
  }

  final String id;
  final String itemId;
  final String borrowerName;
  final DateTime? loanDate;
  final DateTime? returnDate;

  /// true untuk dipulangkan, false untuk belum dipulangkan
  final bool? status;
}

extension LoanUtility on Loan {
  Map<String, dynamic> toMap({bool forInsert = false}) {
    final map = {
      LoanTable.id: id,
      LoanTable.itemId: itemId,
      LoanTable.borrowerName: borrowerName,
      LoanTable.loanDate: loanDate?.toIso8601String(),
      LoanTable.returnDate: returnDate?.toIso8601String(),
      LoanTable.status: status,
    };

    if (forInsert) {
      map.remove(LoanTable.id);
    }

    return map;
  }

  String toJsonString() => jsonEncode(toMap());

  Loan copyWith({
    String? id,
    String? itemId,
    String? borrowerName,
    DateTime? loanDate,
    DateTime? returnDate,
    bool? status,
  }) {
    return Loan(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      borrowerName: borrowerName ?? this.borrowerName,
      loanDate: loanDate ?? this.loanDate,
      returnDate: returnDate ?? this.returnDate,
      status: status ?? this.status,
    );
  }
}

import 'package:ui/database/database_client.dart';
import 'package:ui/database/exceptions/database_exception.dart'
    show DatabaseException;
import 'package:ui/database/tables/loans/loan.dart';

import '../repository.dart';

typedef ListOfLoans = List<Loan>;

class LoanRepository implements Repository<Loan> {
  final _supabase = supabaseClient;

  @override
  Future<ListOfLoans> readAll() async {
    try {
      final data = await _supabase.from(LoanTable.tableName).select();
      return data.map((e) => Loan.fromJson(e)).toList();
    } catch (e) {
      throw DatabaseException('Failed to fetch all loans: $e');
    }
  }

  @override
  Future<ListOfLoans> readSpecificColumns(List<String> columns) async {
    try {
      if (columns.isEmpty) {
        throw DatabaseException('Columns list cannot be empty');
      }
      final select = columns.map((e) => e).join(', ');
      final data = await _supabase.from(LoanTable.tableName).select(select);

      return data.map((json) {
        final completeJson = {
          LoanTable.id: '',
          LoanTable.itemId: '',
          LoanTable.borrowerName: '',
          LoanTable.loanDate: null,
          LoanTable.returnDate: null,
          LoanTable.status: null,
          ...json,
        };

        return Loan.fromJson(completeJson);
      }).toList();
    } catch (e) {
      throw DatabaseException('Failed to fetch specific columns: $e');
    }
  }

  @override
  Future<ListOfLoans> readByEquals(String column, value) async {
    try {
      if (column.isEmpty) {
        throw DatabaseException('Column name cannot be empty');
      }
      final data = await _supabase
          .from(LoanTable.tableName)
          .select()
          .eq(column, value);

      return data.map((e) => Loan.fromJson(e)).toList();
    } catch (e) {
      throw DatabaseException(
        'Failed to fetch loans where $column equals $value: $e',
      );
    }
  }

  @override
  Future<Loan?> readById(String value) async {
    try {
      if (value.isEmpty) {
        throw DatabaseException('ID cannot be empty');
      }
      final data =
          await _supabase
              .from(LoanTable.tableName)
              .select()
              .eq(LoanTable.id, value)
              .maybeSingle();

      if (data == null) return null;
      return Loan.fromJson(data);
    } catch (e) {
      throw DatabaseException('Failed to fetch loan with ID $value: $e');
    }
  }

  @override
  Future<ListOfLoans> readAndSort({
    required String column,
    bool isAscending = true,
    int? limit,
  }) async {
    try {
      final query = _supabase
          .from(LoanTable.tableName)
          .select(column)
          .order(column, ascending: isAscending);

      if (limit != null) {
        return (await query.limit(limit)).map(Loan.fromJson).toList();
      }

      return (await query).map(Loan.fromJson).toList();
    } catch (e) {
      throw DatabaseException('Gagal membaca dan sort: $e');
    }
  }

  @override
  Future<Loan> insert(Loan data) async {
    try {
      if (data.itemId.isEmpty) {
        throw DatabaseException('Item ID cannot be empty');
      }
      if (data.borrowerName.isEmpty) {
        throw DatabaseException('Borrower name cannot be empty');
      }

      final response =
          await _supabase
              .from(LoanTable.tableName)
              .insert(data.toMap(forInsert: true))
              .select()
              .single();

      return Loan.fromJson(response);
    } catch (e) {
      throw DatabaseException(
        'Failed to insert loan for ${data.borrowerName}: $e',
      );
    }
  }

  @override
  Future<Loan> update(Loan data) async {
    try {
      if (data.id.isEmpty) {
        throw DatabaseException('Loan ID cannot be empty for update');
      }

      final exists = await readById(data.id);
      if (exists == null) {
        throw DatabaseException('Loan with ID ${data.id} not found');
      }

      final response =
          await _supabase
              .from(LoanTable.tableName)
              .update(data.toMap())
              .eq(LoanTable.id, data.id)
              .select()
              .single();

      return Loan.fromJson(response);
    } catch (e) {
      throw DatabaseException('Failed to update loan ${data.id}: $e');
    }
  }

  @override
  Future<void> delete(String column, String equals) async {
    try {
      if (column.isEmpty) {
        throw DatabaseException('Column and value cannot be empty');
      }

      if (column == LoanTable.id) {
        final exists = await readById(equals);
        if (exists == null) {
          throw DatabaseException('Loan with ID $equals not found');
        }
      }

      await _supabase.from(LoanTable.tableName).delete().eq(column, equals);
    } catch (e) {
      throw DatabaseException(
        'Failed to delete loan where $column equals $equals: $e',
      );
    }
  }
}

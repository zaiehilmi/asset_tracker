import 'package:ui/database/database_client.dart';
import 'package:ui/database/exceptions/database_exception.dart'
    show DatabaseException;
import 'package:ui/database/tables/maintenance_logs/maintenance_log.dart';
import 'package:ui/database/tables/repository.dart' show Repository;

typedef ListOfLogs = List<MaintenanceLog>;

class MaintenanceLogRepository implements Repository<MaintenanceLog> {
  final _supabase = supabaseClient;

  @override
  Future<ListOfLogs> readAll() async {
    try {
      final data = await _supabase.from(MaintenanceLogTable.tableName).select();
      return data.map(MaintenanceLog.fromJson).toList();
    } catch (e) {
      throw DatabaseException('Failed to fetch all maintenance logs: $e');
    }
  }

  @override
  Future<ListOfLogs> readSpecificColumns(List<String> columns) async {
    try {
      if (columns.isEmpty) {
        throw DatabaseException('Columns list cannot be empty');
      }
      final select = columns.map((e) => e).join(', ');
      final data = await _supabase
          .from(MaintenanceLogTable.tableName)
          .select(select);

      return data.map((json) {
        final completeJson = {
          MaintenanceLogTable.id: '',
          MaintenanceLogTable.itemId: '',
          MaintenanceLogTable.description: '',
          MaintenanceLogTable.date: null,
          MaintenanceLogTable.cost: null,
          ...json,
        };

        return MaintenanceLog.fromJson(completeJson);
      }).toList();
    } catch (e) {
      throw DatabaseException('Failed to fetch specific columns: $e');
    }
  }

  @override
  Future<ListOfLogs> readByEquals(String column, value) async {
    try {
      if (column.isEmpty) {
        throw DatabaseException('Column name cannot be empty');
      }
      final data = await _supabase
          .from(MaintenanceLogTable.tableName)
          .select()
          .eq(column, value);

      return data.map((e) => MaintenanceLog.fromJson(e)).toList();
    } catch (e) {
      throw DatabaseException(
        'Failed to fetch maintenance logs where $column equals $value: $e',
      );
    }
  }

  @override
  Future<MaintenanceLog?> readById(String value) async {
    try {
      if (value.isEmpty) {
        throw DatabaseException('ID cannot be empty');
      }
      final data =
          await _supabase
              .from(MaintenanceLogTable.tableName)
              .select()
              .eq(MaintenanceLogTable.id, value)
              .maybeSingle();

      if (data == null) return null;
      return MaintenanceLog.fromJson(data);
    } catch (e) {
      throw DatabaseException(
        'Failed to fetch maintenance log with ID $value: $e',
      );
    }
  }

  @override
  Future<MaintenanceLog> insert(MaintenanceLog data) async {
    try {
      if (data.itemId.isEmpty) {
        throw DatabaseException('Item ID cannot be empty');
      }

      final response =
          await _supabase
              .from(MaintenanceLogTable.tableName)
              .insert(data.toMap(forInsert: true))
              .select()
              .single();

      return MaintenanceLog.fromJson(response);
    } catch (e) {
      throw DatabaseException('Failed to insert maintenance log: $e');
    }
  }

  @override
  Future<MaintenanceLog> update(MaintenanceLog data) async {
    try {
      if (data.id.isEmpty) {
        throw DatabaseException('Log ID cannot be empty for update');
      }

      final exists = await readById(data.id);
      if (exists == null) {
        throw DatabaseException('Maintenance log with ID ${data.id} not found');
      }

      final response =
          await _supabase
              .from(MaintenanceLogTable.tableName)
              .update(data.toMap())
              .eq(MaintenanceLogTable.id, data.id)
              .select()
              .single();

      return MaintenanceLog.fromJson(response);
    } catch (e) {
      throw DatabaseException(
        'Failed to update maintenance log ${data.id}: $e',
      );
    }
  }

  @override
  Future<void> delete(String column, String equals) async {
    try {
      if (column.isEmpty) {
        throw DatabaseException('Column and value cannot be empty');
      }

      if (column == MaintenanceLogTable.id) {
        final exists = await readById(equals);
        if (exists == null) {
          throw DatabaseException('Maintenance log with ID $equals not found');
        }
      }

      await _supabase
          .from(MaintenanceLogTable.tableName)
          .delete()
          .eq(column, equals);
    } catch (e) {
      throw DatabaseException(
        'Failed to delete maintenance log where $column equals $equals: $e',
      );
    }
  }
}

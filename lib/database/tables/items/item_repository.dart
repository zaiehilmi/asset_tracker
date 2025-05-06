import 'package:ui/database/database_client.dart' show supabaseClient;
import 'package:ui/database/exceptions/database_exception.dart';
import 'package:ui/database/tables/items/item.dart';
import 'package:ui/database/tables/repository.dart' show Repository;
import 'package:ui/utils/talker.dart';

typedef ListOfItems = List<Item>;

class ItemRepository implements Repository<Item> {
  final _supabase = supabaseClient;

  @override
  Future<ListOfItems> readAll() async {
    try {
      final data = await _supabase.from(ItemTable.tableName).select();
      return data.map(Item.fromJson).toList();
    } catch (e) {
      throw DatabaseException('Failed to fetch all items: $e');
    }
  }

  /// Mungkin akan jarang pakai sebab dia akan return nilai dari [columns] yang diinginkan sahaja.
  /// Pada [columns], sila gunakan [ItemTable] untuk type-safe.
  @override
  Future<ListOfItems> readSpecificColumns(List<String> columns) async {
    try {
      if (columns.isEmpty) {
        throw DatabaseException('Columns list cannot be empty');
      }
      final select = columns.map((e) => e).join(', ');
      final data = await _supabase.from(ItemTable.tableName).select(select);

      return data.map((json) {
        // Create a complete map with all fields as null
        final completeJson = {
          ItemTable.id: '',
          ItemTable.name: '',
          ItemTable.purchaseDate: null,
          ItemTable.expiryDate: null,
          ItemTable.price: null,
          ItemTable.location: null,
          ItemTable.notes: null,
          ItemTable.source: null,
          ItemTable.category: null,
          ItemTable.addedDate: null,
          ItemTable.barcode: null,
          ItemTable.parentItemId: null,
          ItemTable.status: null,
          ItemTable.urlLink: null,
          ItemTable.lastUpdatedDate: null,
          // Override with actual values from the response
          ...json,
        };

        return Item.fromJson(completeJson);
      }).toList();
    } catch (e) {
      throw DatabaseException('Failed to fetch specific columns: $e');
    }
  }

  @override
  Future<ListOfItems> readByEquals(String column, Object value) async {
    try {
      if (column.isEmpty) {
        throw DatabaseException('Column name cannot be empty');
      }
      final data = await _supabase
          .from(ItemTable.tableName)
          .select()
          .eq(column, value);

      return data.map(Item.fromJson).toList();
    } catch (e) {
      throw DatabaseException(
        'Failed to fetch items where $column equals $value: $e',
      );
    }
  }

  @override
  Future<Item?> readById(String value) async {
    try {
      if (value.isEmpty) {
        throw DatabaseException('ID cannot be empty');
      }
      final data =
          await _supabase
              .from(ItemTable.tableName)
              .select()
              .eq(ItemTable.id, value)
              .maybeSingle();

      if (data == null) return null;
      return Item.fromJson(data);
    } catch (e) {
      throw DatabaseException('Failed to fetch item with ID $value: $e');
    }
  }

  @override
  Future<ListOfItems> readAndSort({
    required String column,
    bool isAscending = true,
    int? limit,
  }) async {
    try {
      final query = _supabase
          .from(ItemTable.tableName)
          .select()
          .order(column, ascending: isAscending);

      if (limit != null) {
        return (await query.limit(limit)).map(Item.fromJson).toList();
      }

      return (await query).map(Item.fromJson).toList();
    } catch (e) {
      talker.handle(e);
      throw DatabaseException('Gagal membaca dan sort: $e');
    }
  }

  @override
  Future<Item> insert(Item data) async {
    try {
      if (data.name.isEmpty) {
        throw DatabaseException('Item name cannot be empty');
      }
      final response =
          await _supabase
              .from(ItemTable.tableName)
              .insert(data.toMap(forInsert: true))
              .select()
              .single();

      return Item.fromJson(response);
    } catch (e) {
      throw DatabaseException('Failed to insert item ${data.name}: $e');
    }
  }

  @override
  Future<Item> update(Item data) async {
    try {
      if (data.id.isEmpty) {
        throw DatabaseException('Item ID cannot be empty for update');
      }
      // Verify item exists
      final exists = await readById(data.id);
      if (exists == null) {
        throw DatabaseException('Item with ID ${data.id} not found');
      }

      final response =
          await _supabase
              .from(ItemTable.tableName)
              .update(data.toMap())
              .eq(ItemTable.id, data.id)
              .select()
              .single();

      return Item.fromJson(response);
    } catch (e) {
      throw DatabaseException('Failed to update item ${data.id}: $e');
    }
  }

  @override
  Future<void> delete(String column, String equals) async {
    try {
      if (column.isEmpty) {
        throw DatabaseException('Column and value cannot be empty');
      }

      // For ID deletions, verify item exists
      if (column == ItemTable.id) {
        final exists = await readById(equals);
        if (exists == null) {
          throw DatabaseException('Item with ID $equals not found');
        }
      }

      await _supabase.from(ItemTable.tableName).delete().eq(column, equals);
    } catch (e) {
      throw DatabaseException(
        'Failed to delete item where $column equals $equals: $e',
      );
    }
  }
}

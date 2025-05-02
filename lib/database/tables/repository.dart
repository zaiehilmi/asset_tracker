abstract interface class Repository<T> {
  // Read operations
  Future<List<T>> readAll();
  Future<List<T>> readSpecificColumns(List<String> columns);
  // Future<List<T>> readWithPagination({required int from, required int to});

  // Filter operations
  Future<T?> readById(String value);
  Future<List<T>?> readByEquals(String column, Object value);
  // Future<List<T>> readByGreaterThan(String column, dynamic value);
  // Future<List<T>> readByLessThan(String column, dynamic value);
  // Future<List<T>> readByLike(String column, String pattern);
  // Future<List<T>> readByIn(String column, List<dynamic> values);

  // sort operations
  Future<List<T>> readAndSort({
    required String column,
    bool isAscending = true,
    int? limit,
  });

  // Write operations
  Future<T> insert(T data);
  // Future<List<T>> insertMany(List<Map<String, dynamic>> dataList);
  // Future<T> upsert(Map<String, dynamic> data);

  // Update operations
  Future<T> update(T data);

  // Delete operations
  Future<void> delete(String column, String equals);

  // Realtime subscriptions
  // Stream<T> subscribeToInserts();
  // Stream<T> subscribeToUpdates();
  // Stream<T> subscribeToDeletes();
  // Stream<T> subscribeToAll();
  // Stream<T> subscribeWithFilter(String filter);
}

abstract class LocalStorageRepositories {
  void recordId(String id);
  Future<String> getId();
  void clear();
}
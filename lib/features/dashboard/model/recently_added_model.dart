class RecentlyAddedModel {
  RecentlyAddedModel({
    required this.id,
    required this.itemName,
    this.description,
    this.addedAge,
  });

  String id;
  String itemName;
  String? description;
  String? addedAge;
}

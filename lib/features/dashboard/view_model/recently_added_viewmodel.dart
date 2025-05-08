import 'package:june/june.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/model/recently_added_model.dart'
    show RecentlyAddedModel;
import 'package:ui/utils/june_mixin.dart' show JuneCustomMixin;
import 'package:ui/utils/logger.dart' show logger;

final recentlyAddedState = June.getState(RecentlyAddedVM.new);

class RecentlyAddedVM extends JuneState with JuneCustomMixin {
  List<RecentlyAddedModel>? recentlyAddedItems;

  Future<void> fetchRecentlyAddedItems() async {
    resetLoading();

    final items = await ItemRepository().readAndSort(
      column: ItemTable.addedDate,
      limit: 5,
      isAscending: false,
    );
    logger.i('ada ${items.length} daripada 5 item terbaru ditambah');

    recentlyAddedItems =
        items
            .map(
              (i) => RecentlyAddedModel(
                id: i.id,
                itemName: i.name,
                addedAge: '12',
                description: i.notes,
              ),
            )
            .toList();

    setStateAsync();
  }
}

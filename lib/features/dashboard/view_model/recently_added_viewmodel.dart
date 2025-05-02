import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/model/recently_added_model.dart'
    show RecentlyAddedModel;
import 'package:ui/utils/talker.dart';

part 'recently_added_viewmodel.g.dart';

@riverpod
FutureOr<List<RecentlyAddedModel>> recentlyAddedVM(Ref ref) async {
  // TODO: buat sorting dari yang paling baru ke yang paling lama kat repository
  final items = await ItemRepository().readAll();

  talker.info('ada ${items.length} daripada 5 item terbaru ditambah');

  return items
      .map(
        (i) => RecentlyAddedModel(
          id: i.id,
          itemName: i.name,
          addedAge: '12',
          description: i.notes,
        ),
      )
      .toList();
}

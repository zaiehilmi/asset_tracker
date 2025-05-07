import 'package:june/june.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';
import 'package:ui/utils/june_mixin.dart';

final dashboardState = June.getState(DashboardVM.new);

class DashboardVM extends JuneState with JuneCustomMixin {
  Future<void> fetchItem(String id) async {
    resetLoading();
    await itemDetailState.fetchItem(id);
    setStateAsync();
  }
}

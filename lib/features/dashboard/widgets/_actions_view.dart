import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/features/item_management/add_item_screen.dart';

import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/widgets/prefix_in_row.dart';

class ActionsView extends HookConsumerWidget {
  const ActionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final senaraiTindakan = [
      _buildTile(
        context,
        title: 'Tambah Item',
        icon: Amicons.lucide_plus,
        iconBackgroundColor: CupertinoColors.activeBlue,
        onTap:
            () =>
                context.fullScreenDialogRoute(builder: (_) => AddItemScreen()),
      ),
      _buildTile(
        context,
        title: 'Imbas Kod Bar Item',
        subtitle: 'akan datang',
        icon: Amicons.iconly_camera,
        iconBackgroundColor: CupertinoColors.systemGreen,
        onTap: () {},
      ),
      _buildTile(
        context,
        title: 'Urus Pinjaman, Servis, dan lain-lain',
        subtitle: 'akan datang',
        icon: Amicons.iconly_paper_plus,
        iconBackgroundColor: CupertinoColors.systemBrown,
        onTap: () {},
      ),
    ];

    return CupertinoFormSection.insetGrouped(
      backgroundColor: CupertinoColors.systemBackground,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: Gutters.md),
      children: senaraiTindakan.map((item) => item).toList(),
    );
  }
}

// TODO: guna CupertinoPopupSurface untuk keluarkan aksi
CupertinoListTile _buildTile(
  BuildContext context, {
  required String title,
  required IconData icon,
  required Color iconBackgroundColor,
  required VoidCallback onTap,
  String? subtitle,
}) {
  return CupertinoListTile(
    backgroundColor: CupertinoColors.systemGroupedBackground,
    leading: PrefixInRow(icon: icon, iconBackgroundColor: iconBackgroundColor),
    title: Text(
      title,
      style: context.textTheme.actionSmallTextStyle.copyWith(
        color: CupertinoColors.label,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    trailing: CupertinoListTileChevron(),
    subtitle: (subtitle != null) ? Text(subtitle) : null,
    onTap: onTap,
  );
}

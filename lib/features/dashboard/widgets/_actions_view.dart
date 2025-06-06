import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ui/features/item_management/add_item/add_item_screen.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/logger.dart';
import 'package:ui/widgets/prefix_in_row.dart';

class ActionsView extends HookWidget {
  const ActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final senaraiTindakan = [
      _buildTile(
        context,
        title: 'Tambah Item',
        icon: Amicons.lucide_plus,
        iconBackgroundColor: CupertinoColors.activeBlue,
        onTap:
            () => context.sheetRoute<void>(
              rootNavigator: true,
              builder: (_) => const AddItemScreen(),
            ),
      ),
      _buildTile(
        context,
        title: 'Imbas Kod Bar Item',
        subtitle: 'akan datang',
        icon: Amicons.iconly_camera,
        iconBackgroundColor: CupertinoColors.systemGreen,
        onTap: () {
          logger
            ..d('debugg')
            ..e('error')
            ..w('warning')
            ..i('info')
            ..f('fatal')
            ..t('trace');
        },
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
      margin: const EdgeInsets.symmetric(
        horizontal: Gutters.md,
        vertical: Gutters.sm,
      ),
      children: senaraiTindakan.map((item) => item).toList(),
    );
  }
}

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
    trailing: const CupertinoListTileChevron(),
    subtitle: (subtitle != null) ? Text(subtitle) : null,
    onTap: onTap,
  );
}

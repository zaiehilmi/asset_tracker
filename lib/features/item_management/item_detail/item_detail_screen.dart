import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/item_management/item_detail/widgets/_body_detail.dart';
import 'package:ui/features/item_management/item_detail/widgets/_brief_detail.dart';
import 'package:ui/features/item_management/item_detail/widgets/_header_detail.dart'
    show HeaderDetail;

class ItemDetailScreen extends HookWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return null;
    }, []);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          child: const Icon(Amicons.vuesax_edit),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          children: [HeaderDetail(), BriefDetail(), BodyDetail()],
        ),
      ),
    );
  }
}

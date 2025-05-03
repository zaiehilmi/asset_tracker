import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/search/data/kategori_data.dart';
import 'package:ui/features/search/widgets/_card_item.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/widgets/sliver_nav_bar.dart';

class MainSearchScreen extends HookWidget {
  const MainSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarPadding = MediaQuery.of(context).padding.bottom;

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverNavBar(largeTitle: 'Cari', middle: 'Cari'),
          SliverPersistentHeader(
            pinned: true, // Ini yang akan melekatkan header
            delegate: _SearchBarDelegate(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(
              Gutters.md,
            ).copyWith(bottom: navBarPadding + Gutters.md),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              mainAxisSpacing: Gutters.md, // Jarak antara baris
              crossAxisSpacing: Gutters.md, // Jarak antara lajur
              children:
                  kategoriData.map((kategori) {
                    return CardItem(data: kategori);
                  }).toList(),
            ),
          ),
          // SliverFillRemaining(
          //   child: Column(
          //     spacing: Gutters.md,
          //     children: [
          //       ...senaraiKategori.map((kategori) {
          //         return Text(kategori);
          //       }),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: CupertinoColors.systemBackground, // Untuk background yang solid
      padding: const EdgeInsets.symmetric(
        horizontal: Gutters.md,
        vertical: Gutters.sm,
      ),
      child: const CupertinoSearchTextField(
        autocorrect: false,
        placeholder: 'Barang, Kategori, dan lagi',
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;
}

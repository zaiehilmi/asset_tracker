import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui/database/enums/category.dart' show Category;

class KategoriData {
  KategoriData({
    required this.kategori,
    this.icon,
    this.backgroundColor = CupertinoColors.systemBrown,
    this.iconSize = 90,
  });

  final String kategori;
  final IconData? icon;
  final Color backgroundColor;
  final double iconSize;
}

final List<String> _kategoriString =
    Category.values.map((category) => category.toDisplay()).toList();

List<KategoriData> kategoriData =
    _kategoriString
        .map(
          (kategori) => switch (kategori) {
            'Elektronik' => KategoriData(
              kategori: kategori,
              icon: Amicons.vuesax_smart_home_fill,
              backgroundColor: CupertinoColors.systemBlue,
            ),
            'Perabot' => KategoriData(
              kategori: kategori,
              icon: Amicons.flaticon_bed_rounded_fill,
            ),
            'Makanan & Minuman' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_restaurant_fill,
              backgroundColor: CupertinoColors.systemOrange,
            ),
            'Penjagaan Tubuh' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_body_scan_fill,
              backgroundColor: CupertinoColors.systemPink,
            ),
            'Pakaian' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_shirt_fill,
              backgroundColor: CupertinoColors.systemIndigo,
            ),
            'Kebersihan' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_water_flash_fill,
              backgroundColor: CupertinoColors.systemTeal,
            ),
            'Alat Tulis' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_pencil_fill,
              backgroundColor: CupertinoColors.systemGreen,
            ),
            'Ubat' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_medicine_bottle_fill,
              backgroundColor: CupertinoColors.systemRed,
            ),
            'Pertukangan' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_tools_fill,
              backgroundColor: CupertinoColors.systemTeal,
            ),
            'Barangan Dapur' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_shopping_basket2_fill,
              backgroundColor: CupertinoColors.systemYellow,
            ),
            'Barangan Sukan' => KategoriData(
              kategori: kategori,
              icon: Amicons.remix_basketball_fill,
              backgroundColor: CupertinoColors.systemOrange,
            ),
            'Barangan Haiwan Peliharaan' => KategoriData(
              kategori: kategori,
              icon: Amicons.lucide_paw_print,
              backgroundColor: CupertinoColors.systemPurple,
            ),
            _ => KategoriData(
              kategori: kategori,
              icon: Amicons.vuesax_slash,
              backgroundColor: CupertinoColors.systemGrey,
            ),
          },
        )
        .toList();

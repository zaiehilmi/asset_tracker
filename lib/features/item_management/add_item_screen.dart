import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ui/widgets/fullscreen_dialog_scaffold.dart';

class AddItemScreen extends HookWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());

    return FullScreenDialogScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      title: const Text('Tambah Item Baharu'),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Text('Simpan'),
      ),
      child: Form(
        key: formKey.value,

        child: Column(
          children: [
            // TODO: tambah animasi barcode nanti kat atas ni
            CupertinoFormSection.insetGrouped(
              clipBehavior: Clip.hardEdge,
              header: const Text('Maklumat Asas'),
              children: [
                CupertinoTextFormFieldRow(
                  placeholder: 'Nama item (diperlukan)',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  placeholder: 'Huraian',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  placeholder: 'Sumber',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              clipBehavior: Clip.hardEdge,
              header: const Text('Terperinci'),
              children: [
                CupertinoTextFormFieldRow(
                  placeholder: 'Harga',
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  placeholder: 'Kategori',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  placeholder: 'Status',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              clipBehavior: Clip.hardEdge,
              header: const Text('Tarikh penting'),
              children: [
                CupertinoTextFormFieldRow(
                  placeholder: 'Tarikh Pembelian',
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  placeholder: 'Tarikh luput',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

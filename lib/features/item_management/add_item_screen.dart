import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/database/enums/enums.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';

import 'package:ui/widgets/fullscreen_dialog_scaffold.dart';
import 'package:ui/widgets/prefix_in_text_form.dart';

final List<String> _sourceListString =
    Source.values.map((value) => value.toDisplay()).toList();
final List<String> _categoryListString =
    Category.values.map((value) => value.toDisplay()).toList();
final List<String> _statusListString =
    Status.values.map((value) => value.toDisplay()).toList();

class AddItemScreen extends HookWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final sourceController = useTextEditingController(
      text: _sourceListString[0],
    );
    final categoryController = useTextEditingController();
    final statusController = useTextEditingController();

    final textStyle = context.textTheme.textStyle.copyWith(fontSize: 14);

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
                  prefix: PrefixInTextForm(text: 'Nama', isRequired: true),
                  placeholder: 'Shokubutsu sabun mandi',
                  style: textStyle,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: PrefixInTextForm(text: 'Huraian'),
                  placeholder: 'Huraian',
                  style: textStyle,
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
              children: [
                CupertinoTextFormFieldRow(
                  controller: sourceController,
                  prefix: PrefixInTextForm(text: 'Sumber'),
                  style: textStyle,
                  readOnly: true,
                  onTap:
                      () => _showPickerModal(
                        context,
                        items: _sourceListString,
                        controller: sourceController,
                        itemLabelBuilder: (String item) => item,
                      ),
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
              header: const Text('Perincian lain'),
              children: [
                CupertinoTextFormFieldRow(
                  prefix: PrefixInTextForm(text: 'RM'),
                  placeholder: '0.00',
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: categoryController,
                  prefix: PrefixInTextForm(text: 'Kategori'),
                  placeholder: 'Sila pilih',
                  style: textStyle,
                  readOnly: true,
                  onTap:
                      () => _showPickerModal(
                        context,
                        items: _categoryListString,
                        controller: categoryController,
                        itemLabelBuilder: (String item) => item,
                      ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: statusController,
                  prefix: PrefixInTextForm(text: 'Status'),
                  placeholder: 'Sila pilih',
                  style: textStyle,
                  readOnly: true,
                  onTap:
                      () => _showPickerModal(
                        context,
                        items: _statusListString,
                        controller: statusController,
                        itemLabelBuilder: (String item) => item,
                      ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Sila pilih status';
                    }
                    return null;
                  },
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: PrefixInTextForm(text: 'Tarikh beli', width: 70),
                  placeholder: 'Tekan untuk memilih tarikh',
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: PrefixInTextForm(text: 'Tarikh luput', width: 70),
                  placeholder: 'Tekan untuk memilih tarikh',
                  style: textStyle,
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

// Letakkan di luar class AddItemScreen
void _showPickerModal<T>(
  BuildContext context, {
  required List<T> items,
  required TextEditingController controller,
  required String Function(T) itemLabelBuilder,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder:
        (BuildContext context) => Container(
          height: 220,
          padding: const EdgeInsets.only(top: Gutters.sm),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32,
            scrollController: FixedExtentScrollController(
              initialItem: items.indexWhere(
                (item) => itemLabelBuilder(item) == controller.text,
              ),
            ),
            onSelectedItemChanged: (int selectedIndex) {
              controller.text = itemLabelBuilder(items[selectedIndex]);
            },
            children:
                items
                    .map(
                      (item) => Center(
                        child: Text(
                          itemLabelBuilder(item),
                          style: context.textTheme.pickerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
  );
}

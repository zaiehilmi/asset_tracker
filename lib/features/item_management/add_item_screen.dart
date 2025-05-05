import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ui/database/enums/enums.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/extension/datetime.dart';
import 'package:ui/utils/helper/placeholder_for_picker.dart';
import 'package:ui/utils/helper/show_picker_date.dart';
import 'package:ui/utils/helper/show_picker_modal.dart' show showPickerModal;
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
    final purchaseDate = useState<DateTime?>(null);
    final expiryDate = useState<DateTime?>(null);

    useListenable(sourceController);
    useListenable(categoryController);
    useListenable(statusController);

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
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Sumber'),
                  additionalInfo: placeholderForPicker(
                    value: sourceController.text,
                    style: textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap:
                      () => showPickerModal(
                        context,
                        items: _sourceListString,
                        controller: sourceController,
                        itemLabelBuilder: (String item) => item,
                      ),
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
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Kategori'),
                  additionalInfo: placeholderForPicker(
                    value: categoryController.text,
                    style: textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap:
                      () => showPickerModal(
                        context,
                        items: _categoryListString,
                        controller: categoryController,
                        itemLabelBuilder: (String item) => item,
                      ),
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Status'),
                  additionalInfo: placeholderForPicker(
                    value: statusController.text,
                    style: textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap:
                      () => showPickerModal(
                        context,
                        items: _statusListString,
                        controller: statusController,
                        itemLabelBuilder: (String item) => item,
                      ),
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Tarikh beli', width: 70),
                  additionalInfo: placeholderForPicker(
                    value: purchaseDate.value.tarikhNumeral,
                    style: textStyle,
                    placeholder: 'Sila pilih tarikh',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    if (purchaseDate.value == null) {
                      purchaseDate.value = DateTime.now();
                    }

                    showPickerDate<DateTime>(
                      context,
                      date: purchaseDate,
                      showClearButton: true,
                    );
                  },
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Tarikh luput', width: 70),
                  additionalInfo: placeholderForPicker(
                    value: expiryDate.value.tarikhNumeral,
                    style: textStyle,
                    placeholder: 'Sila pilih tarikh',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    if (expiryDate.value == null) {
                      expiryDate.value = DateTime.now();
                    }

                    showPickerDate<DateTime>(
                      context,
                      date: expiryDate,
                      showClearButton: true,
                    );
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

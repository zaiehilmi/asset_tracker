import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ui/features/item_management/view_model/add_item_viewmodel.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/extension/datetime.dart';
import 'package:ui/utils/format_harga.dart';
import 'package:ui/utils/helper/placeholder_for_picker.dart';
import 'package:ui/utils/helper/show_picker_date.dart';
import 'package:ui/utils/helper/show_picker_modal.dart' show showPickerModal;
import 'package:ui/widgets/fullscreen_dialog_scaffold.dart';
import 'package:ui/widgets/prefix_in_text_form.dart';

class AddItemScreen extends HookConsumerWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final viewModel = ref.watch(addItemViewModelProvider);
    final viewModelNotifier = ref.read(addItemViewModelProvider.notifier);

    final namaController = useTextEditingController();
    final huraianController = useTextEditingController();
    final hargaController = useTextEditingController();
    final kategoriController = useTextEditingController();
    final statusController = useTextEditingController();
    final tarikhPembelian = useState<DateTime?>(null);
    final tarikhLuput = useState<DateTime?>(null);
    final sumberController = useTextEditingController(
      text: viewModel.senaraiSumber[0],
    );

    final nameFocusNode = useFocusNode(skipTraversal: true);

    final $textStyle = context.textTheme.textStyle.copyWith(fontSize: 14);

    useListenable(sumberController);
    useListenable(kategoriController);
    useListenable(statusController);

    void onTapSumberField() {
      nameFocusNode.unfocus();

      showPickerModal(
        context,
        items: viewModel.senaraiSumber,
        controller: sumberController,
        itemLabelBuilder: (String item) => item,
      );
    }

    void onTapKategoriField() {
      nameFocusNode.unfocus();

      showPickerModal(
        context,
        items: viewModel.senaraiKategori,
        controller: kategoriController,
        itemLabelBuilder: (String item) => item,
      );
    }

    void onTapStatusField() {
      nameFocusNode.unfocus();

      showPickerModal(
        context,
        items: viewModel.senaraiStatus,
        controller: statusController,
        itemLabelBuilder: (String item) => item,
      );
    }

    void onTapTarikhPembelian() {
      nameFocusNode.unfocus();
      if (tarikhPembelian.value == null) {
        tarikhPembelian.value = DateTime.now();
      }

      showPickerDate<DateTime>(
        context,
        date: tarikhPembelian,
        showClearButton: true,
      );
    }

    void onTapTarikhLuput() {
      nameFocusNode.unfocus();

      showPickerDate<DateTime>(
        context,
        date: tarikhLuput,
        showClearButton: true,
      );
    }

    void onChangedInputHarga(String value) {
      final formattedPrice = formatHarga(value);

      if (formattedPrice != value) {
        hargaController.value = TextEditingValue(
          text: formattedPrice,
          selection: TextSelection.collapsed(offset: formattedPrice.length),
        );
      }
    }

    void onPressedSimpan() {
      if (formKey.value.currentState?.validate() ?? false) {
        viewModelNotifier
          ..setNama(namaController.text)
          ..setHuraian(huraianController.text)
          ..setHarga(hargaController.text)
          ..setSumber(sumberController.text)
          ..setKategori(kategoriController.text)
          ..setStatus(statusController.text)
          ..setTarikhPembelian(tarikhPembelian.value)
          ..setTarikhLuput(tarikhLuput.value)
          ..onSubmit();
      }
    }

    useEffect(() {
      nameFocusNode.requestFocus();
      return null;
    }, const []);

    return FullScreenDialogScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      title: const Text('Tambah Item Baharu'),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressedSimpan,
        child: const Text('Simpan'),
      ),
      child: Form(
        key: formKey.value,

        child: Column(
          children: [
            CupertinoFormSection.insetGrouped(
              clipBehavior: Clip.hardEdge,
              header: const Text('Maklumat Asas'),
              children: [
                CupertinoTextFormFieldRow(
                  controller: namaController,
                  focusNode: nameFocusNode,
                  prefix: PrefixInTextForm(text: 'Nama', isRequired: true),
                  placeholder: 'Shokubutsu sabun mandi',
                  style: $textStyle,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama barang';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: huraianController,
                  prefix: PrefixInTextForm(text: 'Huraian'),
                  placeholder: 'Huraian',
                  style: $textStyle,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                ),
              ],
            ),

            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Sumber'),
                  additionalInfo: placeholderForPicker(
                    value: sumberController.text,
                    style: $textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: onTapSumberField,
                ),
              ],
            ),

            CupertinoFormSection.insetGrouped(
              clipBehavior: Clip.hardEdge,
              header: const Text('Perincian lain'),
              children: [
                CupertinoTextFormFieldRow(
                  controller: hargaController,
                  prefix: PrefixInTextForm(text: 'RM'),
                  placeholder: '0.00',
                  style: $textStyle,
                  keyboardType: TextInputType.number,
                  onChanged: onChangedInputHarga,
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Kategori'),
                  additionalInfo: placeholderForPicker(
                    value: kategoriController.text,
                    style: $textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: onTapKategoriField,
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Status'),
                  additionalInfo: placeholderForPicker(
                    value: statusController.text,
                    style: $textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: onTapStatusField,
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Tarikh beli', width: 70),
                  additionalInfo: placeholderForPicker(
                    value: tarikhPembelian.value.tarikhNumeral,
                    style: $textStyle,
                    placeholder: 'Sila pilih tarikh',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: onTapTarikhPembelian,
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Tarikh luput', width: 70),
                  additionalInfo: placeholderForPicker(
                    value: tarikhLuput.value.tarikhNumeral,
                    style: $textStyle,
                    placeholder: 'Sila pilih tarikh',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: onTapTarikhLuput,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

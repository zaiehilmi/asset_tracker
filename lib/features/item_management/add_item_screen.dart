import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ui/features/item_management/view_model/add_item_viewmodel.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/extension/datetime.dart';
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
    final sumberController = useTextEditingController(
      text: viewModelNotifier.sourceListString[0],
    );
    final kategoriController = useTextEditingController();
    final statusController = useTextEditingController();
    final tarikhPembelian = useState<DateTime?>(null);
    final tarikhLuput = useState<DateTime?>(null);

    final nameFocusNode = useFocusNode(skipTraversal: true);

    useListenable(sumberController);
    useListenable(kategoriController);
    useListenable(statusController);

    final textStyle = context.textTheme.textStyle.copyWith(fontSize: 14);

    useEffect(() {
      nameFocusNode.requestFocus();
      return null;
    }, const []);

    return FullScreenDialogScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      title: const Text('Tambah Item Baharu'),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (formKey.value.currentState?.validate() ?? false) {
            viewModelNotifier.onSubmit();
          }
        },
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
                  style: textStyle,
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
                  initialValue: viewModel.huraian,
                  onChanged: viewModelNotifier.setHuraian,
                  prefix: PrefixInTextForm(text: 'Huraian'),
                  placeholder: 'Huraian',
                  style: textStyle,
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
                    style: textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    nameFocusNode.unfocus();
                    showPickerModal(
                      context,
                      items: viewModelNotifier.sourceListString,
                      controller: sumberController,
                      itemLabelBuilder: (String item) => item,
                    );
                  },
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
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    final formattedPrice = formatPrice(value);

                    if (formattedPrice != value) {
                      hargaController.value = TextEditingValue(
                        text: formattedPrice,
                        selection: TextSelection.collapsed(
                          offset: formattedPrice.length,
                        ),
                      );
                    }
                  },
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Kategori'),
                  additionalInfo: placeholderForPicker(
                    value: kategoriController.text,
                    style: textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    nameFocusNode.unfocus();
                    showPickerModal(
                      context,
                      items: viewModelNotifier.categoryListString,
                      controller: kategoriController,
                      itemLabelBuilder: (String item) => item,
                    );
                  },
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Status'),
                  additionalInfo: placeholderForPicker(
                    value: statusController.text,
                    style: textStyle,
                    placeholder: 'Sila pilih',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    nameFocusNode.unfocus();

                    showPickerModal(
                      context,
                      items: viewModelNotifier.statusListString,
                      controller: statusController,
                      itemLabelBuilder: (String item) => item,
                    );
                  },
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Tarikh beli', width: 70),
                  additionalInfo: placeholderForPicker(
                    value: tarikhPembelian.value.tarikhNumeral,
                    style: textStyle,
                    placeholder: 'Sila pilih tarikh',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    nameFocusNode.unfocus();
                    if (tarikhPembelian.value == null) {
                      tarikhPembelian.value = DateTime.now();
                    }

                    showPickerDate<DateTime>(
                      context,
                      date: tarikhPembelian,
                      showClearButton: true,
                    );
                  },
                ),
                CupertinoListTile(
                  title: PrefixInTextForm(text: 'Tarikh luput', width: 70),
                  additionalInfo: placeholderForPicker(
                    value: tarikhLuput.value.tarikhNumeral,
                    style: textStyle,
                    placeholder: 'Sila pilih tarikh',
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    nameFocusNode.unfocus();
                    showPickerDate<DateTime>(
                      context,
                      date: tarikhLuput,
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

String formatPrice(String value) {
  if (value.isEmpty) return '0.00';

  final format = value.replaceAll(RegExp('[^0-9]'), '');
  final cents = int.parse(format);

  final keSen = (cents / 100).toStringAsFixed(2);

  return keSen;
}

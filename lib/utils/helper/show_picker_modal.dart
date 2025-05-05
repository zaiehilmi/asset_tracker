import 'package:flutter/cupertino.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/helper/show_picker.dart';

void showPickerModal<T>(
  BuildContext context, {
  required List<T> items,
  required TextEditingController controller,
  required String Function(T) itemLabelBuilder,
}) => showPicker<T>(
  context,
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
);

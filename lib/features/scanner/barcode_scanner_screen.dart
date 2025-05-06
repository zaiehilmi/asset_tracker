import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui/features/scanner/view_model/barcode_scanner_viewmodel.dart';
import 'package:ui/utils/logger.dart';

class BarcodeScannerScreen extends HookConsumerWidget {
  const BarcodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scannerController = useMemoized(MobileScannerController.new);

    final vm = ref.watch(barcodeScannerViewmodelProvider);
    final vmNotifier = ref.read(barcodeScannerViewmodelProvider.notifier);

    return CupertinoPageScaffold(
      child: Expanded(
        child: MobileScanner(
          controller: scannerController,
          onDetect: (capture) {
            final barcode = capture.barcodes.first;
            if (barcode.rawValue == null) return;
            final value = barcode.rawValue!;
            if (value.isEmpty) return;

            logger.i('Barcode detected: $value');
            vmNotifier.barcode = value;
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui/features/scanner/view_model/barcode_scanner_viewmodel.dart';
import 'package:ui/features/scanner/widgets/_torchlight_button.dart'
    show TorchlightButton;
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/logger.dart';

class BarcodeScannerScreen extends HookConsumerWidget {
  const BarcodeScannerScreen({
    super.key,
    this.directGoAfterSuccessfulScan = false,
  });

  final bool directGoAfterSuccessfulScan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scannerController = useMemoized(MobileScannerController.new);

    final vm = ref.watch(barcodeScannerViewmodelProvider);
    final vmNotifier = ref.read(barcodeScannerViewmodelProvider.notifier);

    void onDetectBarcode(BarcodeCapture capture) {
      final barcode = capture.barcodes.first;
      final value = barcode.rawValue;
      if (value == null || value.isEmpty) return;

      logger.i('Barcode detected: $value');
      vmNotifier.barcode = value;
      // Navigator.pop(context);
    }

    useEffect(() {
      return scannerController.dispose;
    }, []);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.sizeOf.height * 0.1),
            Expanded(
              child: MobileScanner(
                controller: scannerController,
                onDetect: onDetectBarcode,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(Gutters.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TorchlightButton(onPressed: scannerController.toggleTorch),
                  if (vm.isNotEmpty)
                    CupertinoButton.tinted(
                      child: Text('Cari Sekarang'),
                      onPressed: () {},
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

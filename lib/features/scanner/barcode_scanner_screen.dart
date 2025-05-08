import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui/features/scanner/view_model/barcode_scanner_viewmodel.dart';
import 'package:ui/features/scanner/widgets/_torchlight_button.dart'
    show TorchlightButton;
import 'package:ui/navigation/application_viewmodel.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/logger.dart';

class BarcodeScannerScreen extends HookWidget {
  const BarcodeScannerScreen({
    super.key,
    this.directGoOnDetected = false,
    this.buttonTitle = 'Cari Sekarang',
  });

  /// jangan guna buat masa ni. rosak.
  final bool directGoOnDetected;

  /// hanya akan muncul jika [directGoOnDetected] adalah false
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    final scannerController = useMemoized(MobileScannerController.new);
    final kodbarController = useState<String?>(null);

    void onDetectBarcode(BarcodeCapture capture) {
      final barcode = capture.barcodes.first;
      final value = barcode.rawValue;
      if (value == null || value.isEmpty) return;

      kodbarController.value = value;
      logger.i('Nilai kod bar dikesan: $value');

      if (directGoOnDetected) {
        Navigator.of(context).pop(kodbarController.value);
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        applicationState.brightness = Brightness.dark;
      });

      return () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scannerController
            ..stop()
            ..dispose();
          if (context.mounted) {
            applicationState.brightness = Brightness.light;
          }
        });
      };
    }, []);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(automaticallyImplyMiddle: false),
      child: SafeArea(
        child: JuneBuilder(
          BarcodeScannerVM.new,
          builder:
              (vm) => Column(
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
                        TorchlightButton(
                          onPressed: scannerController.toggleTorch,
                        ),
                        if (kodbarController.value != null &&
                            !directGoOnDetected)
                          CupertinoButton.tinted(
                            child: Text(buttonTitle),
                            onPressed:
                                () => Navigator.of(
                                  context,
                                ).pop(kodbarController.value),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}

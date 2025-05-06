import 'package:june/june.dart';

mixin JuneCustomMixin on JuneState {
  bool isLoading = true;

  /// guna bila ada promises
  void setLoadingEnd() {
    isLoading = false;
    setState();
  }
}

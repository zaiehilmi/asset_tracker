import 'package:june/june.dart';

mixin JuneCustomMixin on JuneState {
  bool isLoading = false;

  /// guna bila ada promises
  void setStateAsync() {
    isLoading = false;
    setState();
  }

  /// guna bila ada promises. Letak di permulaan function
  void resetLoading() {
    isLoading = true;
    setState();
  }
}

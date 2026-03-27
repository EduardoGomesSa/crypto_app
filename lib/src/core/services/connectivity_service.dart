import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool isConnected = true.obs;
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _subscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    isConnected.value = !result.contains(ConnectivityResult.none);
  }

  Future<void> checkNow() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}

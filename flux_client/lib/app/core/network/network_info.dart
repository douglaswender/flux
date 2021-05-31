import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<ConnectivityResult> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity dataConnectionChecker;

  NetworkInfoImpl(this.dataConnectionChecker);

  @override
  Future<ConnectivityResult> get isConnected =>
      dataConnectionChecker.checkConnectivity();
}

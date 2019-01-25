import 'package:connectivity/connectivity.dart';

class ApplicationService {

  Future<bool> isConnected() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }
}
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class AppConnection {
  static StreamSubscription<ConnectivityResult> getConnection() {
    return Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        connectivityResult = result;
        // if (result == ConnectivityResult.none) {
        //   whenDisconnected != null ? whenDisconnected() : null;
        // } else {
        //   whenConnected != null ? whenConnected() : null;
        // }
      },
    );
  }
  static ConnectivityResult connectivityResult = ConnectivityResult.none;
}

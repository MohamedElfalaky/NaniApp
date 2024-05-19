import 'package:rxdart/subjects.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionConfig {
  ConnectionConfig._private();
  static ConnectionConfig get instance {
    return _instance;
  }

  BehaviorSubject<bool> isConnected = BehaviorSubject();
  final Connectivity _connectivity = Connectivity();
  static final ConnectionConfig _instance = ConnectionConfig._private();

  Future<void> init() async {
    List<ConnectivityResult> connectivity =
        await _connectivity.checkConnectivity();

    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      print('Data connection is available.');
      isConnected.value = true;
      return;
    } else if (connectivity.contains(ConnectivityResult.none)) {
      print('You are disconnected from the internet.');
      isConnected.value = false;
      return;
    }

    // switch (connectivity) {
    //   case ConnectivityResult.mobile:
    //   case ConnectivityResult.wifi:
    //     isConnected.value = true;
    //     break;
    //   case ConnectivityResult.none:
    //     isConnected.value = false;
    //     break;
    //   default:
    // }

    _connectivity.onConnectivityChanged.listen((status) {
      if (status.contains(ConnectivityResult.mobile) ||
          status.contains(ConnectivityResult.mobile)) {
        print('Data connection is available.');
        isConnected.value = true;
        return;
      } else if (status.contains(ConnectivityResult.none)) {
        print('You are disconnected from the internet.');
        isConnected.value = false;
        return;
      }

      // switch (status) {
      //   case ConnectivityResult.mobile:
      //   case ConnectivityResult.wifi:
      //     print('Data connection is available.');
      //     isConnected.value = true;
      //     break;
      //   case ConnectivityResult.none:
      //     print('You are disconnected from the internet.');
      //     isConnected.value = false;
      //     break;
      //   default:
      //     print('');
      // }
    });
  }
}

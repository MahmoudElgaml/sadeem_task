import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'global_connection_state.dart';

class GlobalConnectionCubit extends Cubit<GlobalConnectionState> {
  GlobalConnectionCubit() : super(Disconnected());
  void checkConnection() async {
    var connectionResult = await Connectivity().checkConnectivity();
    ubdateConnection(connectionResult.single);
  }

  void ubdateConnection(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        emit(Disconnected());
        break;
      default:
        emit(Connected());
        break;
    }
  }

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  trackConnection() {
    _subscription = Connectivity().onConnectivityChanged.listen(
      (event) {
        ubdateConnection(event.single);
      },
    );
  }
}

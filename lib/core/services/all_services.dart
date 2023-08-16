import 'get_connection.dart';
import 'shared_preference.dart';

Future<void> allServices() async {
  await Prefs.init();
  AppConnection.getConnection();
}

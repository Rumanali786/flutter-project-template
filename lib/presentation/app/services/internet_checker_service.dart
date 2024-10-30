import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class InternetCheckerClass {
  static Future<bool> checkInternetStatus() async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      } else {
        bool hasInternet = await hasInternetConnection();
        if (!hasInternet) {
          return false;
        } else {
          return true;
        }
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final url = Uri.https('google.com');
      final response = await http.head(url).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('', 408); // 408 is the status code for "Request Timeout"
        },
      );
      if (response.statusCode == 200) {

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("internet error ${e.toString()}");
      return false;
    }
  }
}

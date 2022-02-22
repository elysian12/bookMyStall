import 'package:shared_preferences/shared_preferences.dart';

class MySharedService {
  Future<bool> setSharedService(String token) async {
    final prefs = await SharedPreferences.getInstance();
    print('----Shared-token-----------$token----');
    bool isDone = await prefs.setString('authToken', token);
    return isDone;
  }

  Future<bool> setSharedPhone(String token) async {
    final prefs = await SharedPreferences.getInstance();
    print('----Shared-phone-----------$token----');
    bool isDone = await prefs.setString('phone', token);
    return isDone;
  }

  Future<bool> setSharedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    print('----Shared-phone-----------$city----');
    bool isDone = await prefs.setString('city', city);
    return isDone;
  }

  Future<String?> getSharedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<String?> getSharedPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone');
  }

  Future<String?> getSharedCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('city');
  }
}

import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String _error = '';
  
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      // TODO: Implement actual authentication
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      // TODO: Implement actual registration
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
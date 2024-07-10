import 'package:flutter/material.dart';
import '../services/dog_service.dart';
import '../models/dog.dart';


class DogProvider with ChangeNotifier {
  final DogService _dogService = DogService();
  Dog? _dogImage;
  bool _isLoading = false;

  Dog? get dogImage => _dogImage;
  bool get isLoading => _isLoading;

  Future<void> fetchRandomDogImage() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _dogImage = await _dogService.fetchRandomDogImage();

    } catch (e) {
      _dogImage = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

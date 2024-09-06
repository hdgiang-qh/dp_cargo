import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final _selectedIndexController = 1.obs;

  updateSelectedIndex(int index) => _selectedIndexController(index);

  int get selectedIndex => _selectedIndexController.value;
}

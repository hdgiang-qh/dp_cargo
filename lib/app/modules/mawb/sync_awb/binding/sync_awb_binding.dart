import 'package:get/get.dart';
import '../controller/sync_awb_controller.dart';

class SyncAwbBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SyncAwbController>(() => SyncAwbController(),
        fenix: true);
  }

}
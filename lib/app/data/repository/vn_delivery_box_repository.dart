import '../model/model/vn_delivery_box.dart';

abstract class VnDeliveryBoxRepository {
  Future<List<VnDeliveryBox>> getListVnDeliveryBoxes();

  Future vnDeliveryBoxNote(int id, String note);

  Future vnDeliveryBoxReceiving(List<String> codes);
}
import 'vn_delivery_box.dart';
import 'vn_delivery_order.dart';

class MergedDelivery {
  final VnDeliveryOrder vnDeliveryOrder;
  final List<VnDeliveryBox> vnDeliveryBoxes;

  MergedDelivery(this.vnDeliveryOrder, this.vnDeliveryBoxes);
}
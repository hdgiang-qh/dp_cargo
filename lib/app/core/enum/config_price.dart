enum TrackingType {
  regularGoods(2, "Hàng thường"),
  cosmeticsPerfumesWatches(3, "Mỹ Phẩm - Nước Hoa - Đồng Hồ"),
  electronics(4, "Hàng điện tử"),
  laptop(5, "Laptop"),
  cigars(6, "Cigars"),
  bbw(7, "BBW"),
  clothing(8, "Giày dép, Quần áo");

  final int id;
  final String trackingType;


  const TrackingType(this.id, this.trackingType);

  static TrackingType? fromValue(int? value) {
    if (value == null) return null;
    try {
      return TrackingType.values.firstWhere(
            (trackingType) => trackingType.id == value
      );
    } catch (e) {
      return null;
    }
  }
}
enum Warehouse {
  HCM(1, "HCM"),
  HN(2, "Hà nội");


  final int id;
  final String warehouse;


  const Warehouse(this.id, this.warehouse);

  static Warehouse? fromValue(int? value) {
    if (value == null) return null;
    try {
      return Warehouse.values.firstWhere(
              (warehouse) => warehouse.id == value
      );
    } catch (e) {
      return null;
    }
  }
}
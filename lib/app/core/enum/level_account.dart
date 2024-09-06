

enum LevelAccount {
  superAdmin(1, "Super Admin"),
  custom(3, "Khách hàng"),
  accountant(7, "Kế toán"),
  miningStaff(8, "Nhân viên khai thác"),
  manage(9, "Quản lý"),
  customerCareStaff(10,"Nhân viên CSKH"),
  businessMan(11,"Nhân viên kinh doanh"),
  shipper(18,"Shipper");

  final int id;
  final String value;

  const LevelAccount(this.id, this.value);

  static LevelAccount? fromId(int? id) {
    if (id == null) return null;
    try {
      return LevelAccount.values.firstWhere(
            (level) => level.id == id,
      );
    } catch (e) {
      return null;
    }
  }

  static LevelAccount? fromValue(String? value) {
    if (value == null) return null;
    try {
      return LevelAccount.values.firstWhere(
            (level) => level.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}
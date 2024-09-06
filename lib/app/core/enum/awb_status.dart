import 'dart:ui';

enum AwbStatus {
  all('Tất cả', Color(0xffb92f2e), Color(0x3b92f2e)),
  synchronizing('Đang đồng bộ', Color(0xFFB58A00), Color(0x33B58A00)),
  synchronizationFailed("Đồng bộ thất bại", Color(0xFF751414), Color(0x33751414)),
  delivering("Đang vận chuyển về vn", Color(0xFF70BBFD), Color(0x3370BBFD)),
  delivered('Đã vận chuyển về vn', Color(0xFF3380FF), Color(0x333380FF)),
  exploiting('Đang khai thác', Color(0xFF367A56), Color(0x33367A56)),
  exploited('Đã khai thác', Color(0xFF2D346F), Color(0x332D346F));


  final String value;
  final Color color;
  final Color colorBg;

  const AwbStatus(this.value, this.color, this.colorBg);

  static AwbStatus? fromValue(String? value) {
    if (value == null) return null;
    try {
      return AwbStatus.values.firstWhere(
            (status) => status.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}



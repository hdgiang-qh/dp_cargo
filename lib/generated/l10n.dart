// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone_number {
    return Intl.message(
      'Số điện thoại',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Vui long nhập số điện thoại`
  String get please_input_phone_number {
    return Intl.message(
      'Vui long nhập số điện thoại',
      name: 'please_input_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không hợp lệ`
  String get phone_not_valid {
    return Intl.message(
      'Số điện thoại không hợp lệ',
      name: 'phone_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu`
  String get please_input_password {
    return Intl.message(
      'Vui lòng nhập mật khẩu',
      name: 'please_input_password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu quá ngắn`
  String get pass_too_short {
    return Intl.message(
      'Mật khẩu quá ngắn',
      name: 'pass_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa có tài khoản?`
  String get not_account {
    return Intl.message(
      'Bạn chưa có tài khoản?',
      name: 'not_account',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get register {
    return Intl.message(
      'Đăng ký',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản`
  String get register_account {
    return Intl.message(
      'Đăng ký tài khoản',
      name: 'register_account',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại bạn muốn đăng ký tài khoản. Chúng tôi sẽ gửi một mã kích hoạt đến số điện thoại của bạn.`
  String get register_label {
    return Intl.message(
      'Nhập số điện thoại bạn muốn đăng ký tài khoản. Chúng tôi sẽ gửi một mã kích hoạt đến số điện thoại của bạn.',
      name: 'register_label',
      desc: '',
      args: [],
    );
  }

  /// `Đã có tài khoản?`
  String get have_account {
    return Intl.message(
      'Đã có tài khoản?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã OTP`
  String get input_otp {
    return Intl.message(
      'Nhập mã OTP',
      name: 'input_otp',
      desc: '',
      args: [],
    );
  }

  /// `Hãy nhập mã xác minh 6 chữ số đã được gửi đến số điện thoại {phone}`
  String input_otp_label(Object phone) {
    return Intl.message(
      'Hãy nhập mã xác minh 6 chữ số đã được gửi đến số điện thoại $phone',
      name: 'input_otp_label',
      desc: '',
      args: [phone],
    );
  }

  /// `Xác minh`
  String get verify {
    return Intl.message(
      'Xác minh',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã sau: `
  String get resent_otp_after {
    return Intl.message(
      'Gửi lại mã sau: ',
      name: 'resent_otp_after',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại`
  String get resent {
    return Intl.message(
      'Gửi lại',
      name: 'resent',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin cá nhân`
  String get user_info {
    return Intl.message(
      'Thông tin cá nhân',
      name: 'user_info',
      desc: '',
      args: [],
    );
  }

  /// `Mọi thông tin cá nhân bạn cung cấp đều được chúng tôi bảo mật nghiêm ngặt.`
  String get user_info_label {
    return Intl.message(
      'Mọi thông tin cá nhân bạn cung cấp đều được chúng tôi bảo mật nghiêm ngặt.',
      name: 'user_info_label',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên`
  String get full_name {
    return Intl.message(
      'Họ tên',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh`
  String get birth_day {
    return Intl.message(
      'Ngày sinh',
      name: 'birth_day',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp tục`
  String get continue_text {
    return Intl.message(
      'Tiếp tục',
      name: 'continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập tên`
  String get please_input_name {
    return Intl.message(
      'Vui lòng nhập tên',
      name: 'please_input_name',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập ngày sinh`
  String get please_input_birthDay {
    return Intl.message(
      'Vui lòng nhập ngày sinh',
      name: 'please_input_birthDay',
      desc: '',
      args: [],
    );
  }

  /// `Nhập họ tên`
  String get input_name {
    return Intl.message(
      'Nhập họ tên',
      name: 'input_name',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email`
  String get please_input_email {
    return Intl.message(
      'Vui lòng nhập email',
      name: 'please_input_email',
      desc: '',
      args: [],
    );
  }

  /// `@gmail.com`
  String get input_hint_email {
    return Intl.message(
      '@gmail.com',
      name: 'input_hint_email',
      desc: '',
      args: [],
    );
  }

  /// `Email không hợp lệ`
  String get email_not_valid {
    return Intl.message(
      'Email không hợp lệ',
      name: 'email_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính`
  String get sex {
    return Intl.message(
      'Giới tính',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `Nam`
  String get male {
    return Intl.message(
      'Nam',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Nữ`
  String get female {
    return Intl.message(
      'Nữ',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Tạo mật khẩu`
  String get create_pass {
    return Intl.message(
      'Tạo mật khẩu',
      name: 'create_pass',
      desc: '',
      args: [],
    );
  }

  /// `Thiết lập mật khẩu cho tài khoản của bạn. \nMật khẩu yêu cầu lớn hơn 6 ký tự`
  String get create_pass_label {
    return Intl.message(
      'Thiết lập mật khẩu cho tài khoản của bạn. \nMật khẩu yêu cầu lớn hơn 6 ký tự',
      name: 'create_pass_label',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu`
  String get re_password {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 're_password',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu không đúng`
  String get password_not_match {
    return Intl.message(
      'Nhập lại mật khẩu không đúng',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Tra cứu`
  String get monitor {
    return Intl.message(
      'Tra cứu',
      name: 'monitor',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản`
  String get account {
    return Intl.message(
      'Tài khoản',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào`
  String get hello {
    return Intl.message(
      'Xin chào',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Ngôn ngữ`
  String get language {
    return Intl.message(
      'Ngôn ngữ',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi mật khẩu`
  String get change_pass {
    return Intl.message(
      'Thay đổi mật khẩu',
      name: 'change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin thuê bao`
  String get info_subscription {
    return Intl.message(
      'Thông tin thuê bao',
      name: 'info_subscription',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ hỗ trợ`
  String get contact_support {
    return Intl.message(
      'Liên hệ hỗ trợ',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Cẩm nang an ninh, an toàn`
  String get security {
    return Intl.message(
      'Cẩm nang an ninh, an toàn',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Hướng dẫn sử dụng`
  String get guide {
    return Intl.message(
      'Hướng dẫn sử dụng',
      name: 'guide',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất tài khoản`
  String get logout {
    return Intl.message(
      'Đăng xuất tài khoản',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Mã OTP không hợp lệ`
  String get otp_not_valid {
    return Intl.message(
      'Mã OTP không hợp lệ',
      name: 'otp_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản thành công`
  String get register_success {
    return Intl.message(
      'Đăng ký tài khoản thành công',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `Không hoạt động`
  String get disconnected {
    return Intl.message(
      'Không hoạt động',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Hoạt động`
  String get connect {
    return Intl.message(
      'Hoạt động',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `Session hết hạn`
  String get expired_session {
    return Intl.message(
      'Session hết hạn',
      name: 'expired_session',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách bộ trung tâm trống.\nVui lòng liên hệ CSKH để mua thiết bị.`
  String get home_empty_list {
    return Intl.message(
      'Danh sách bộ trung tâm trống.\nVui lòng liên hệ CSKH để mua thiết bị.',
      name: 'home_empty_list',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ`
  String get contact {
    return Intl.message(
      'Liên hệ',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Bộ trung tâm`
  String get central_set {
    return Intl.message(
      'Bộ trung tâm',
      name: 'central_set',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệt độ`
  String get temp {
    return Intl.message(
      'Nhiệt độ',
      name: 'temp',
      desc: '',
      args: [],
    );
  }

  /// `Cảnh báo`
  String get alert {
    return Intl.message(
      'Cảnh báo',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Bật`
  String get on {
    return Intl.message(
      'Bật',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Tắt`
  String get off {
    return Intl.message(
      'Tắt',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Độ ẩm`
  String get humidity {
    return Intl.message(
      'Độ ẩm',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách cảm biến`
  String get sensor_list {
    return Intl.message(
      'Danh sách cảm biến',
      name: 'sensor_list',
      desc: '',
      args: [],
    );
  }

  /// `Thêm cảm biến`
  String get add_sensor {
    return Intl.message(
      'Thêm cảm biến',
      name: 'add_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt`
  String get setting {
    return Intl.message(
      'Cài đặt',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa thông tin vị trí`
  String get edit_address {
    return Intl.message(
      'Chỉnh sửa thông tin vị trí',
      name: 'edit_address',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa thông tin bộ trung tâm`
  String get edit_central {
    return Intl.message(
      'Chỉnh sửa thông tin bộ trung tâm',
      name: 'edit_central',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách người nhận thông báo`
  String get list_receiver_notify {
    return Intl.message(
      'Danh sách người nhận thông báo',
      name: 'list_receiver_notify',
      desc: '',
      args: [],
    );
  }

  /// `Nhật ký hoạt động`
  String get activity_history {
    return Intl.message(
      'Nhật ký hoạt động',
      name: 'activity_history',
      desc: '',
      args: [],
    );
  }

  /// `Hẹn giờ bật tắt cảnh báo`
  String get timer_clock {
    return Intl.message(
      'Hẹn giờ bật tắt cảnh báo',
      name: 'timer_clock',
      desc: '',
      args: [],
    );
  }

  /// `Tổng đài cảnh báo`
  String get alert_hotline {
    return Intl.message(
      'Tổng đài cảnh báo',
      name: 'alert_hotline',
      desc: '',
      args: [],
    );
  }

  /// `Gia hạn thiết bị`
  String get extend_device {
    return Intl.message(
      'Gia hạn thiết bị',
      name: 'extend_device',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo sự cố thiết bị`
  String get report_issue {
    return Intl.message(
      'Báo cáo sự cố thiết bị',
      name: 'report_issue',
      desc: '',
      args: [],
    );
  }

  /// `Xoá bỏ vị trí này`
  String get delete_address {
    return Intl.message(
      'Xoá bỏ vị trí này',
      name: 'delete_address',
      desc: '',
      args: [],
    );
  }

  /// `Xoá bỏ bộ trung tâm này`
  String get delete_central {
    return Intl.message(
      'Xoá bỏ bộ trung tâm này',
      name: 'delete_central',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin`
  String get information {
    return Intl.message(
      'Thông tin',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `DS nhận thông báo`
  String get receiver_notify {
    return Intl.message(
      'DS nhận thông báo',
      name: 'receiver_notify',
      desc: '',
      args: [],
    );
  }

  /// `Tên vị trí`
  String get address_name {
    return Intl.message(
      'Tên vị trí',
      name: 'address_name',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get address {
    return Intl.message(
      'Địa chỉ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Loại hình kinh doanh`
  String get business_type {
    return Intl.message(
      'Loại hình kinh doanh',
      name: 'business_type',
      desc: '',
      args: [],
    );
  }

  /// `Người liên hệ`
  String get contact_name {
    return Intl.message(
      'Người liên hệ',
      name: 'contact_name',
      desc: '',
      args: [],
    );
  }

  /// `SĐT người liên hệ`
  String get contact_number {
    return Intl.message(
      'SĐT người liên hệ',
      name: 'contact_number',
      desc: '',
      args: [],
    );
  }

  /// `Ngày ký hợp đồng`
  String get contract_date {
    return Intl.message(
      'Ngày ký hợp đồng',
      name: 'contract_date',
      desc: '',
      args: [],
    );
  }

  /// `Ngày bảo trì tiếp theo`
  String get alert_date {
    return Intl.message(
      'Ngày bảo trì tiếp theo',
      name: 'alert_date',
      desc: '',
      args: [],
    );
  }

  /// `Lưu lại`
  String get save {
    return Intl.message(
      'Lưu lại',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật thành công`
  String get update_success {
    return Intl.message(
      'Cập nhật thành công',
      name: 'update_success',
      desc: '',
      args: [],
    );
  }

  /// `Nhận cuộc gọi`
  String get phone_receiver {
    return Intl.message(
      'Nhận cuộc gọi',
      name: 'phone_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Nhận tin nhắn`
  String get sms_receiver {
    return Intl.message(
      'Nhận tin nhắn',
      name: 'sms_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Thêm người nhận mới`
  String get add_new_receiver {
    return Intl.message(
      'Thêm người nhận mới',
      name: 'add_new_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Sửa người nhận thông báo`
  String get edit_receiver {
    return Intl.message(
      'Sửa người nhận thông báo',
      name: 'edit_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Chức vụ`
  String get position {
    return Intl.message(
      'Chức vụ',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại`
  String get input_phone {
    return Intl.message(
      'Nhập số điện thoại',
      name: 'input_phone',
      desc: '',
      args: [],
    );
  }

  /// `Nhập chức vụ`
  String get input_position {
    return Intl.message(
      'Nhập chức vụ',
      name: 'input_position',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Quay lại`
  String get back {
    return Intl.message(
      'Quay lại',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Xóa người này`
  String get delete_user {
    return Intl.message(
      'Xóa người này',
      name: 'delete_user',
      desc: '',
      args: [],
    );
  }

  /// `Tên gateway`
  String get gateway_name {
    return Intl.message(
      'Tên gateway',
      name: 'gateway_name',
      desc: '',
      args: [],
    );
  }

  /// `Loại`
  String get type {
    return Intl.message(
      'Loại',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Serial`
  String get serial {
    return Intl.message(
      'Serial',
      name: 'serial',
      desc: '',
      args: [],
    );
  }

  /// `Phiên bản`
  String get version {
    return Intl.message(
      'Phiên bản',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Số sim`
  String get sim_number {
    return Intl.message(
      'Số sim',
      name: 'sim_number',
      desc: '',
      args: [],
    );
  }

  /// `Ngày kích hoạt`
  String get activate_date {
    return Intl.message(
      'Ngày kích hoạt',
      name: 'activate_date',
      desc: '',
      args: [],
    );
  }

  /// `Số ngày còn lại`
  String get remaining_day {
    return Intl.message(
      'Số ngày còn lại',
      name: 'remaining_day',
      desc: '',
      args: [],
    );
  }

  /// `Trạng thái`
  String get state {
    return Intl.message(
      'Trạng thái',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Lần cập nhật cuối`
  String get latest_update {
    return Intl.message(
      'Lần cập nhật cuối',
      name: 'latest_update',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get notification {
    return Intl.message(
      'Thông báo',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Thiết bị`
  String get device {
    return Intl.message(
      'Thiết bị',
      name: 'device',
      desc: '',
      args: [],
    );
  }

  /// `Còn lại`
  String get remaining {
    return Intl.message(
      'Còn lại',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Gia hạn thêm`
  String get extend_more {
    return Intl.message(
      'Gia hạn thêm',
      name: 'extend_more',
      desc: '',
      args: [],
    );
  }

  /// `Thêm cảm biến thủ công`
  String get add_node_manual {
    return Intl.message(
      'Thêm cảm biến thủ công',
      name: 'add_node_manual',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có thể tìm thấy mã số Serial trên vỏ hộp hoặc trên thiết bị cảm biến của chúng tôi.`
  String get add_node_hint {
    return Intl.message(
      'Bạn có thể tìm thấy mã số Serial trên vỏ hộp hoặc trên thiết bị cảm biến của chúng tôi.',
      name: 'add_node_hint',
      desc: '',
      args: [],
    );
  }

  /// `Thêm serial cảm biến`
  String get input_sensor {
    return Intl.message(
      'Thêm serial cảm biến',
      name: 'input_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Nhập serial`
  String get input_serial {
    return Intl.message(
      'Nhập serial',
      name: 'input_serial',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy số serial?`
  String get serial_not_found {
    return Intl.message(
      'Không tìm thấy số serial?',
      name: 'serial_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ CSKH`
  String get contact_cskh {
    return Intl.message(
      'Liên hệ CSKH',
      name: 'contact_cskh',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập serial`
  String get please_input_serial {
    return Intl.message(
      'Vui lòng nhập serial',
      name: 'please_input_serial',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin cảm biến`
  String get sensor_info {
    return Intl.message(
      'Thông tin cảm biến',
      name: 'sensor_info',
      desc: '',
      args: [],
    );
  }

  /// `Tên cảm biến`
  String get sensor_name {
    return Intl.message(
      'Tên cảm biến',
      name: 'sensor_name',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên cảm biến`
  String get input_sensor_name {
    return Intl.message(
      'Nhập tên cảm biến',
      name: 'input_sensor_name',
      desc: '',
      args: [],
    );
  }

  /// `Loại cảm biến`
  String get sensor_type {
    return Intl.message(
      'Loại cảm biến',
      name: 'sensor_type',
      desc: '',
      args: [],
    );
  }

  /// `Serial cảm biến`
  String get sensor_serial {
    return Intl.message(
      'Serial cảm biến',
      name: 'sensor_serial',
      desc: '',
      args: [],
    );
  }

  /// `Mã cảm biến`
  String get sensor_code {
    return Intl.message(
      'Mã cảm biến',
      name: 'sensor_code',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập tên cảm biến`
  String get please_input_sensor_name {
    return Intl.message(
      'Vui lòng nhập tên cảm biến',
      name: 'please_input_sensor_name',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý`
  String get warning {
    return Intl.message(
      'Lưu ý',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `ID tài khoản`
  String get account_id {
    return Intl.message(
      'ID tài khoản',
      name: 'account_id',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngôn ngữ`
  String get select_language {
    return Intl.message(
      'Chọn ngôn ngữ',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng việt`
  String get vietnamese {
    return Intl.message(
      'Tiếng việt',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng anh`
  String get english {
    return Intl.message(
      'Tiếng anh',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Lựa chọn`
  String get select {
    return Intl.message(
      'Lựa chọn',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu cũ`
  String get old_password {
    return Intl.message(
      'Mật khẩu cũ',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu cũ không đúng`
  String get password_old_not_match {
    return Intl.message(
      'Mật khẩu cũ không đúng',
      name: 'password_old_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Thủ công`
  String get manual {
    return Intl.message(
      'Thủ công',
      name: 'manual',
      desc: '',
      args: [],
    );
  }

  /// `Chụp ảnh nhanh`
  String get take_photo {
    return Intl.message(
      'Chụp ảnh nhanh',
      name: 'take_photo',
      desc: '',
      args: [],
    );
  }

  /// `Đầu ra 1`
  String get out_put1 {
    return Intl.message(
      'Đầu ra 1',
      name: 'out_put1',
      desc: '',
      args: [],
    );
  }

  /// `Đầu ra 2`
  String get out_put2 {
    return Intl.message(
      'Đầu ra 2',
      name: 'out_put2',
      desc: '',
      args: [],
    );
  }

  /// `Vị trí triển khai`
  String get activity_location {
    return Intl.message(
      'Vị trí triển khai',
      name: 'activity_location',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin liên hệ`
  String get contact_info {
    return Intl.message(
      'Thông tin liên hệ',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `Tên`
  String get name {
    return Intl.message(
      'Tên',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa thông tin`
  String get edit_info {
    return Intl.message(
      'Chỉnh sửa thông tin',
      name: 'edit_info',
      desc: '',
      args: [],
    );
  }

  /// `Số thuê bao`
  String get subscriber_number {
    return Intl.message(
      'Số thuê bao',
      name: 'subscriber_number',
      desc: '',
      args: [],
    );
  }

  /// `Ngày đăng ký`
  String get subscribed_date {
    return Intl.message(
      'Ngày đăng ký',
      name: 'subscribed_date',
      desc: '',
      args: [],
    );
  }

  /// `Ngày hết hạn`
  String get expired_date {
    return Intl.message(
      'Ngày hết hạn',
      name: 'expired_date',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin bộ trung tâm`
  String get info_central {
    return Intl.message(
      'Thông tin bộ trung tâm',
      name: 'info_central',
      desc: '',
      args: [],
    );
  }

  /// `Điện áp`
  String get voltage {
    return Intl.message(
      'Điện áp',
      name: 'voltage',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký ngay`
  String get register_now {
    return Intl.message(
      'Đăng ký ngay',
      name: 'register_now',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập ngay`
  String get login_now {
    return Intl.message(
      'Đăng nhập ngay',
      name: 'login_now',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập thông tin để tiến hành để đăng ký tài khoản khách hàng`
  String get input_info_for_register {
    return Intl.message(
      'Vui lòng nhập thông tin để tiến hành để đăng ký tài khoản khách hàng',
      name: 'input_info_for_register',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng bạn quay trở lại.`
  String get welcome_back {
    return Intl.message(
      'Chào mừng bạn quay trở lại.',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get forget_password {
    return Intl.message(
      'Quên mật khẩu',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã nhớ lại mật khẩu`
  String get you_remember_password {
    return Intl.message(
      'Bạn đã nhớ lại mật khẩu',
      name: 'you_remember_password',
      desc: '',
      args: [],
    );
  }

  /// `Tracking`
  String get tracking {
    return Intl.message(
      'Tracking',
      name: 'tracking',
      desc: '',
      args: [],
    );
  }

  /// `PXK`
  String get pxk {
    return Intl.message(
      'PXK',
      name: 'pxk',
      desc: '',
      args: [],
    );
  }

  /// `Giao dịch`
  String get transaction {
    return Intl.message(
      'Giao dịch',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm Tracking`
  String get search_tracking {
    return Intl.message(
      'Tìm kiếm Tracking',
      name: 'search_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Phiếu xuất kho`
  String get pxk_title {
    return Intl.message(
      'Phiếu xuất kho',
      name: 'pxk_title',
      desc: '',
      args: [],
    );
  }

  /// `Bộ lọc tìm kiếm`
  String get filter {
    return Intl.message(
      'Bộ lọc tìm kiếm',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết PXK`
  String get order_detail {
    return Intl.message(
      'Chi tiết PXK',
      name: 'order_detail',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã`
  String get insert_code {
    return Intl.message(
      'Nhập mã',
      name: 'insert_code',
      desc: '',
      args: [],
    );
  }

  /// `Thêm Tracking`
  String get add_tracking {
    return Intl.message(
      'Thêm Tracking',
      name: 'add_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Thêm PXK`
  String get add_pxk {
    return Intl.message(
      'Thêm PXK',
      name: 'add_pxk',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mã`
  String get cf_code {
    return Intl.message(
      'Xác nhận mã',
      name: 'cf_code',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu mới`
  String get enter_new_password {
    return Intl.message(
      'Nhập mật khẩu mới',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách Tracking`
  String get list_trackings {
    return Intl.message(
      'Danh sách Tracking',
      name: 'list_trackings',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết Tracking`
  String get tracking_detail {
    return Intl.message(
      'Chi tiết Tracking',
      name: 'tracking_detail',
      desc: '',
      args: [],
    );
  }

  /// `Số dư`
  String get balance {
    return Intl.message(
      'Số dư',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật tài khoản`
  String get update_user {
    return Intl.message(
      'Cập nhật tài khoản',
      name: 'update_user',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết tin tài khoản`
  String get detail_user_info {
    return Intl.message(
      'Chi tiết tin tài khoản',
      name: 'detail_user_info',
      desc: '',
      args: [],
    );
  }

  /// `Chính sách hỗ trợ`
  String get policy_support {
    return Intl.message(
      'Chính sách hỗ trợ',
      name: 'policy_support',
      desc: '',
      args: [],
    );
  }

  /// `Dịch vụ khách hàng 24/7`
  String get service_24_7 {
    return Intl.message(
      'Dịch vụ khách hàng 24/7',
      name: 'service_24_7',
      desc: '',
      args: [],
    );
  }

  /// `Điều khoản và chính sách`
  String get rules_policy {
    return Intl.message(
      'Điều khoản và chính sách',
      name: 'rules_policy',
      desc: '',
      args: [],
    );
  }

  /// `Chia sẻ ứng dụng`
  String get share_app {
    return Intl.message(
      'Chia sẻ ứng dụng',
      name: 'share_app',
      desc: '',
      args: [],
    );
  }

  /// `Giới thiệu về DP - Cargo`
  String get about_app {
    return Intl.message(
      'Giới thiệu về DP - Cargo',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Loại hàng hóa`
  String get product_type {
    return Intl.message(
      'Loại hàng hóa',
      name: 'product_type',
      desc: '',
      args: [],
    );
  }

  /// `Loại giao dịch`
  String get transaction_type {
    return Intl.message(
      'Loại giao dịch',
      name: 'transaction_type',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền GD`
  String get transaction_money {
    return Intl.message(
      'Số tiền GD',
      name: 'transaction_money',
      desc: '',
      args: [],
    );
  }

  /// `Số dư sau GD`
  String get balance_transaction_money {
    return Intl.message(
      'Số dư sau GD',
      name: 'balance_transaction_money',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian`
  String get transaction_date {
    return Intl.message(
      'Thời gian',
      name: 'transaction_date',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú`
  String get note {
    return Intl.message(
      'Ghi chú',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Nhập thông tin`
  String get input_info {
    return Intl.message(
      'Nhập thông tin',
      name: 'input_info',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian`
  String get time {
    return Intl.message(
      'Thời gian',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Áp dụng`
  String get apply {
    return Intl.message(
      'Áp dụng',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Thiết lập lại`
  String get reset {
    return Intl.message(
      'Thiết lập lại',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết giao dịch`
  String get transaction_detail {
    return Intl.message(
      'Chi tiết giao dịch',
      name: 'transaction_detail',
      desc: '',
      args: [],
    );
  }

  /// `Mã giao dịch`
  String get transaction_code {
    return Intl.message(
      'Mã giao dịch',
      name: 'transaction_code',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản ngân hàng`
  String get bank_account {
    return Intl.message(
      'Tài khoản ngân hàng',
      name: 'bank_account',
      desc: '',
      args: [],
    );
  }

  /// `Tải ảnh lên`
  String get upload_image {
    return Intl.message(
      'Tải ảnh lên',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Hủy giao dịch`
  String get cancel_transaction {
    return Intl.message(
      'Hủy giao dịch',
      name: 'cancel_transaction',
      desc: '',
      args: [],
    );
  }

  /// `Nạp tiền`
  String get recharge {
    return Intl.message(
      'Nạp tiền',
      name: 'recharge',
      desc: '',
      args: [],
    );
  }

  /// `Chấp thuận`
  String get approve {
    return Intl.message(
      'Chấp thuận',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ảnh từ`
  String get select_media {
    return Intl.message(
      'Chọn ảnh từ',
      name: 'select_media',
      desc: '',
      args: [],
    );
  }

  /// `Tín dụng`
  String get credit_amount {
    return Intl.message(
      'Tín dụng',
      name: 'credit_amount',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật`
  String get update {
    return Intl.message(
      'Cập nhật',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Gọi điện thành công`
  String get returns_order_success {
    return Intl.message(
      'Gọi điện thành công',
      name: 'returns_order_success',
      desc: '',
      args: [],
    );
  }

  /// `Nhận đơn thành công`
  String get receive_order_success {
    return Intl.message(
      'Nhận đơn thành công',
      name: 'receive_order_success',
      desc: '',
      args: [],
    );
  }

  /// `Về trang chủ`
  String get homepage {
    return Intl.message(
      'Về trang chủ',
      name: 'homepage',
      desc: '',
      args: [],
    );
  }

  /// `Khách hàng`
  String get customer {
    return Intl.message(
      'Khách hàng',
      name: 'customer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

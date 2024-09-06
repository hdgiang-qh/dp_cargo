import '../../../generated/l10n.dart';

mixin Validator {
  final RegExp _phoneRegex = RegExp(r'(\+84|84|0)\d{9}$');

  final _regExpPass = RegExp(r'^.{6,}');

  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String? checkPhoneNumber(String? phoneNumber) {
    if (phoneNumber!.trim().isEmpty) {
      return S.current.please_input_phone_number;
    } else if (!_phoneRegex.hasMatch(phoneNumber.trim())) {
      return S.current.phone_not_valid;
    } else {
      return null;
    }
  }

  String? checkOldPassword(String? pass, String? oldPass) {
    if (pass!.trim().isEmpty) {
      return S.current.please_input_password;
    } else if (pass.trim() != oldPass?.trim()) {
      return S.current.password_not_match;
    } else {
      return null;
    }
  }

  String? checkPassword(String? pass) {
    if (pass!.trim().isEmpty) {
      return S.current.please_input_password;
    } else if (!_regExpPass.hasMatch(pass.trim())) {
      return S.current.pass_too_short;
    } else {
      return null;
    }
  }

  String? checkRePassword(String? pass, String? rePass) {
    if (rePass!.trim().isEmpty) {
      return S.current.please_input_password;
    } else if (rePass != pass) {
      return S.current.password_not_match;
    } else {
      return null;
    }
  }

  String? validatorName(String? name) {
    if (name!.trim().isEmpty) {
      return S.current.please_input_name;
    } else {
      return null;
    }
  }

  String? checkSerial(String? serial) {
    if (serial!.trim().isEmpty) {
      return S.current.please_input_serial;
    } else {
      return null;
    }
  }

  String? checkSensorName(String? name) {
    if (name!.trim().isEmpty) {
      return S.current.please_input_sensor_name;
    } else {
      return null;
    }
  }

  String? validatorBirthday(String? birthday) {
    if (birthday!.trim().isEmpty) {
      return S.current.please_input_birthDay;
    } else {
      return null;
    }
  }

  String? checkEmail(String? email) {
    if (email!.trim().isEmpty) {
      return S.current.please_input_email;
    } else if (!_emailRegex.hasMatch(email.trim())) {
      return S.current.email_not_valid;
    } else {
      return null;
    }
  }

  String? checkEmpty(String? text) {
    if (text!.trim().isEmpty) {
      return 'Vui lòng nhập';
    } else {
      return null;
    }
  }
}

import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/data/model/model/staff.dart';

import '../model/interface_model.dart';
import '../model/permission_model.dart';

class ConfigurationBoxResponse {
  List<ConfigurationBox>? listCoeBox;
  String? message;

  ConfigurationBoxResponse({this.listCoeBox, this.message});

  ConfigurationBoxResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCoeBox = <ConfigurationBox>[];
      json['data'].forEach((v) {
        listCoeBox!.add(ConfigurationBox.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (listCoeBox != null) {
      data['data'] = listCoeBox!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ConfigurationInformationResponse {
  List<ConfigurationInformation>? listCoeInfor;
  String? message;

  ConfigurationInformationResponse({this.listCoeInfor, this.message});

  ConfigurationInformationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCoeInfor = <ConfigurationInformation>[];
      json['data'].forEach((v) {
        listCoeInfor!.add(ConfigurationInformation.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (listCoeInfor != null) {
      data['data'] = listCoeInfor!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ConfigurationPrefixResponse {
  List<ConfigurationPrefix>? listCoePrefix;
  String? message;

  ConfigurationPrefixResponse({this.listCoePrefix, this.message});

  ConfigurationPrefixResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCoePrefix = <ConfigurationPrefix>[];
      json['data'].forEach((v) {
        listCoePrefix!.add(ConfigurationPrefix.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (listCoePrefix != null) {
      data['data'] = listCoePrefix!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ConfigurationMailResponse {
  List<ConfigurationMail>? listCoeMail;
  String? message;

  ConfigurationMailResponse({this.listCoeMail, this.message});

  ConfigurationMailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCoeMail = <ConfigurationMail>[];
      json['data'].forEach((v) {
        listCoeMail!.add(ConfigurationMail.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (listCoeMail != null) {
      data['data'] = listCoeMail!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ConfigurationGroupResponse {
  List<StaffRoleName>? listCoeGroup;
  String? message;

  ConfigurationGroupResponse({this.listCoeGroup, this.message});

  ConfigurationGroupResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCoeGroup = <StaffRoleName>[];
      json['data'].forEach((v) {
        listCoeGroup!.add(StaffRoleName.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listCoeGroup != null) {
      data['data'] = listCoeGroup!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;

    return data;
  }
}

class ConfigurationGroupDetailResponse {
  StaffRoleName? listCoeGroupDetail;
  List<StaffAction>? listAction;
  String? message;

  ConfigurationGroupDetailResponse(
      {this.listCoeGroupDetail, this.listAction, this.message});

  ConfigurationGroupDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCoeGroupDetail = StaffRoleName.fromJson(json['data']);
    }
    if (json['data']['actions'] != null) {
      listAction = <StaffAction>[];
      json['data']['actions'].forEach((v) {
        listAction!.add(StaffAction.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listCoeGroupDetail != null) {
      data['data'] = listCoeGroupDetail!;
    }
    if (listAction != null) {
      data['data'] = listAction!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;

    return data;
  }
}

class ConfigurationPermissionResponse {
  List<PermissionsModel>? listPermission;
  String? message;

  ConfigurationPermissionResponse({this.listPermission, this.message});

  ConfigurationPermissionResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listPermission = <PermissionsModel>[];
      json['data'].forEach((v) {
        listPermission!.add(PermissionsModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listPermission != null) {
      data['data'] = listPermission!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;

    return data;
  }
}

class ConfigurationPriceResponse {
  List<ConfigurationPrice>? listPrice;
  List<ConfigurationPriceConfigValueConfig>? listPriceConfig;
  String? message;

  ConfigurationPriceResponse({this.listPrice, this.message});

  ConfigurationPriceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listPrice = <ConfigurationPrice>[];
      json['data'].forEach((v) {
        listPrice!.add(ConfigurationPrice.fromJson(v));
      });
      for(int i = 0; i< listPrice!.length;i++){
        if (json['data'][i]['configValue']['config'] != null) {
          listPriceConfig = <ConfigurationPriceConfigValueConfig>[];
          json['data'][i]['configValue']['config'].forEach((v) {
            listPriceConfig!.add(ConfigurationPriceConfigValueConfig.fromJson(v));
          });
        }
      }
    }

    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listPrice != null) {
      data['data'] = listPrice!.map((v) => v.toJson()).toList();
      for(int i =0; i< listPrice!.length;i++){
        if (listPriceConfig != null) {
          data['data'][i]['configValue']['config'].map((v) => v.toJson()).toList();
        }
      }
    }
    data['message'] = message;

    return data;
  }
}

class ConfigurationInterfaceResponse {
  List<InterfaceModel>? listInterface;
  String? message;

  ConfigurationInterfaceResponse({this.listInterface, this.message});

  ConfigurationInterfaceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listInterface = <InterfaceModel>[];
      json['data'].forEach((v) {
        listInterface!.add(InterfaceModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listInterface != null) {
      data['data'] = listInterface!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;

    return data;
  }
}

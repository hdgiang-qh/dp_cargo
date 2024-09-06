import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/base/base_view.dart';
import '../controllers/auth_controller.dart';

class AuthView extends BaseView<AuthenticationController> {
  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Assets.images.splash.image();
  }
}

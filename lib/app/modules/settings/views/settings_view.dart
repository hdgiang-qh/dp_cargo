import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'user_info.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../data/service/auth_service.dart';
import '../../../data/service/setting_service.dart';
import '../../../routes/app_pages.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppbarCustom(
      centerTitle: false,
      backGroundColor: const Color(0xffF9F9F9),
      titleWidget: Obx(() {
        return Text(
          Get.find<AuthService>().userInfo.value?.fullname ?? '',
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        );
      }),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        const Gap(24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.smallMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff02083D).withOpacity(0.05),
                offset: const Offset(0, 12),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              ItemSettings(
                title: appLocalization.user_info,
                prefixImage: Assets.icons.logo.svg(height: 24, width: 24),
                suffixImage: 'arrow_forward.svg',
                onTap: () {
                  Get.to(const UserInfo());
                },
              ),
              _getHorizontalDivider(),
              ItemSettings(
                title: appLocalization.language,
                prefixImage: Assets.icons.logo.svg(),
                suffixImage: 'arrow_forward.svg',
                onTap: () async {
                  final result = await showModalBottomSheet<Locale>(
                      context: context,
                      builder: (context) {
                        return const LanguagePopUp();
                      });
                  if (result != null) {
                    Get.find<SettingService>().updateLocale(result);
                  }
                },
              ),
              _getHorizontalDivider(),
              ItemSettings(
                title: appLocalization.change_pass,
                prefixImage: Assets.icons.logo.svg(),
                suffixImage: 'arrow_forward.svg',
                onTap: () {
                  Get.toNamed(Routes.CHANGE_PASSWORD);
                },
              ),
              _getHorizontalDivider(),
              ItemSettings(
                title: appLocalization.info_subscription,
                prefixImage: Assets.icons.logo.svg(),
                suffixImage: 'arrow_forward.svg',
                onTap: () {},
              ),
              _getHorizontalDivider(),
              ItemSettings(
                title: appLocalization.contact_support,
                prefixImage: Assets.icons.logo.svg(),
                suffixImage: 'arrow_forward.svg',
                onTap: _onFontSizeItemClicked,
              ),
              _getHorizontalDivider(),
              ItemSettings(
                title: appLocalization.security,
                prefixImage: Assets.icons.logo.svg(),
                suffixImage: 'arrow_forward.svg',
                onTap: _onFontSizeItemClicked,
              ),
              _getHorizontalDivider(),
              ItemSettings(
                title: appLocalization.guide,
                prefixImage: Assets.icons.logo.svg(),
                suffixImage: 'arrow_forward.svg',
                onTap: _onFontSizeItemClicked,
              ),
            ],
          ),
        ),
        const Gap(16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.smallMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff02083D).withOpacity(0.05),
                offset: const Offset(0, 12),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              ItemSettings(
                title: appLocalization.logout,
                color: AppColors.secondary2,
                prefixImage: Assets.icons.logo.svg(
                    height: 24, width: 24, colorFilter: const ColorFilter.mode(AppColors.secondary2, BlendMode.srcIn)),
                onTap: () {
                  Get.find<AuthService>().signOut();
                  Get.offAllNamed(Routes.AUTHENTICATION);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return Divider(
      height: 1,
      color: AppColors.lineColorBold,
    );
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }
}

class LanguagePopUp extends StatefulWidget {
  const LanguagePopUp({super.key});

  @override
  State<LanguagePopUp> createState() => _LanguagePopUpState();
}

class _LanguagePopUpState extends State<LanguagePopUp> {
  late Locale locale;

  @override
  void initState() {
    locale = Get.find<SettingService>().currentLocate.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(8),
            Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xffe2eaf3))),
            const Gap(8),
            Text(
              S.of(context).select_language,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const Gap(8),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: S.delegate.supportedLocales.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          locale = e;
                        });
                      },
                      textColor: AppColors.lineColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: locale.languageCode == e.languageCode ? AppColors.primary : AppColors.text_hint,
                            width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      leading: e.flag,
                      title: Text(
                        e.title(context),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: locale.languageCode == e.languageCode ? AppColors.primary : AppColors.text_hint),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const Gap(23),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryOpaction, foregroundColor: AppColors.primary),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    S.of(context).back,
                  ),
                )),
                const Gap(7),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    Get.back(result: locale);
                  },
                  child: Text(
                    S.of(context).select,
                  ),
                )),
              ],
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}

extension LocaleExt on Locale {
  String title(BuildContext context) {
    if (languageCode == 'vi') {
      return S.of(context).vietnamese;
    }
    if (languageCode == 'en') {
      return S.of(context).english;
    }
    return S.of(context).vietnamese;
  }

  Widget get flag {
    if (languageCode == 'vi') {
      return Assets.icons.logo.svg(height: 16, width: 24);
    }
    if (languageCode == 'en') {
      return Assets.icons.logo.svg(height: 16, width: 24);
    }
    return Assets.icons.logo.svg(height: 16, width: 24);
  }
}

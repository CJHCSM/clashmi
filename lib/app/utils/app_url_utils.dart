import 'package:flutter/widgets.dart';

import 'package:clashmi/app/modules/setting_manager.dart';
import 'package:clashmi/app/private/app_url_utils_private.dart';
import 'package:clashmi/app/utils/app_utils.dart';
import 'package:clashmi/app/utils/did.dart';
import 'package:clashmi/app/utils/install_referrer_utils.dart';

abstract final class AppUrlUtils {
  static String getQueryParamsForAnalytics(int bodyLen) {
    return AppUrlUtilsPrivate.signQueryParams(
        AppUtils.getBuildinVersion(), bodyLen, {});
  }

  static Future<String> getQueryParamsForUrl(int bodyLen) async {
    String planguageTag = [
      WidgetsBinding.instance.platformDispatcher.locale.languageCode,
      WidgetsBinding.instance.platformDispatcher.locale.countryCode ?? ""
    ].join("-");
    var config = SettingManager.getConfig();

    String did = await Did.getDid();
    bool firstTime = await Did.getFirstTime();
    String installRefer = await InstallReferrerUtils.getString();

    installRefer = installRefer.replaceAll(" ", "").toLowerCase();
    String src =
        (WidgetsBinding.instance.platformDispatcher.locale.countryCode ?? "")
            .toLowerCase();

    Map<String, dynamic> params = {
      "s_r_c": Uri.encodeComponent(src),
      "l_t": Uri.encodeComponent(config.languageTag),
      "s_l_t": Uri.encodeComponent(planguageTag),
      "t_z_o":
          Uri.encodeComponent(DateTime.now().timeZoneOffset.inHours.toString()),
      "did": Uri.encodeComponent(did),
      "new": Uri.encodeComponent(firstTime.toString()),
      "from": Uri.encodeComponent("clashmi"),
      "i_r": Uri.encodeComponent(installRefer),
    };

    return AppUrlUtilsPrivate.signQueryParams(
        AppUtils.getBuildinVersion(), bodyLen, params);
  }
}

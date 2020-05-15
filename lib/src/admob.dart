import 'dart:ui';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/services.dart';

class Admob {
  static const _channel = MethodChannel('admob_flutter');

  Admob.initialize(String appId) {
    _channel.invokeMethod('initialize', appId);
  }

  static Future<Size> bannerSize(AdmobBannerSize admobBannerSize) async {
    final rawResult =
        await _channel.invokeMethod('banner_size', admobBannerSize.toMap);
    final resultMap = Map<String, num>.from(rawResult);
    return Size(
        resultMap["width"].ceilToDouble(), resultMap["height"].ceilToDouble());
  }
}

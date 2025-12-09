import 'dart:developer';

import 'package:flutter/foundation.dart';

class Debug {
  /// SET VALUE FALSE FOR RELEASE
  static const debug = kDebugMode;

  static printLog(String str) {
    if (debug) log(str);
  }

  static printLoge(String str, dynamic msg) {
    if (debug) log("$str ==> $msg");
  }
}

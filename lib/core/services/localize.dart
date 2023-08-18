import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class MyLocale {
  static late S s;
  static void setServices(BuildContext context) => s = S.of(context);
}

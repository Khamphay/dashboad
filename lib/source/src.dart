import 'dart:io';

import 'package:intl/intl.dart';

final fm = NumberFormat("#,###.##", 'en_US');
final isWinLinuxMac =
    Platform.isWindows || Platform.isMacOS || Platform.isLinux;

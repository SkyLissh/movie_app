import "dart:io";
import "package:flutter/foundation.dart" show kIsWeb;

final kIsDesktop =
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
final kAppBarHeight = kIsDesktop ? 120.0 : 80.0;

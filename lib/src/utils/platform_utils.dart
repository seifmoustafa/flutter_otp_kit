import 'package:flutter/foundation.dart';

// Conditional imports for WASM compatibility
import 'dart:io' if (dart.library.html) '../services/_platform_web.dart';

/// Platform utilities that work across all platforms including WASM
class PlatformUtils {
  /// Check if running on iOS
  static bool get isIOS {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  /// Check if running on Android
  static bool get isAndroid {
    if (kIsWeb) return false;
    return Platform.isAndroid;
  }

  /// Check if running on Windows
  static bool get isWindows {
    if (kIsWeb) return false;
    return Platform.isWindows;
  }

  /// Check if running on macOS
  static bool get isMacOS {
    if (kIsWeb) return false;
    return Platform.isMacOS;
  }

  /// Check if running on Linux
  static bool get isLinux {
    if (kIsWeb) return false;
    return Platform.isLinux;
  }

  /// Check if running on any desktop platform
  static bool get isDesktop {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  /// Check if running on any mobile platform
  static bool get isMobile {
    if (kIsWeb) return false;
    return Platform.isIOS || Platform.isAndroid;
  }

  /// Check if running on web
  static bool get isWeb => kIsWeb;
}

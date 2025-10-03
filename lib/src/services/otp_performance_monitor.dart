import 'dart:async';
import 'package:flutter/foundation.dart';
import '../config/otp_performance_config.dart';

/// Performance monitoring service for OTP Kit
///
/// Tracks memory usage, animation performance, and provides
/// optimization recommendations for better user experience.
class OtpPerformanceMonitor {
  static OtpPerformanceMonitor? _instance;
  static OtpPerformanceMonitor get instance =>
      _instance ??= OtpPerformanceMonitor._();

  OtpPerformanceMonitor._();

  /// Stream controller for performance metrics
  final StreamController<Map<String, dynamic>> _metricsController =
      StreamController<Map<String, dynamic>>.broadcast();

  /// Stream controller for memory usage
  final StreamController<int> _memoryController =
      StreamController<int>.broadcast();

  /// Stream controller for animation performance
  final StreamController<double> _animationController =
      StreamController<double>.broadcast();

  /// Stream of performance metrics
  Stream<Map<String, dynamic>> get metricsStream => _metricsController.stream;

  /// Stream of memory usage
  Stream<int> get memoryStream => _memoryController.stream;

  /// Stream of animation performance (FPS)
  Stream<double> get animationStream => _animationController.stream;

  /// Current performance configuration
  OtpPerformanceConfig? _config;

  /// Performance monitoring timer
  Timer? _monitoringTimer;

  /// Animation performance tracker
  final List<DateTime> _frameTimes = [];

  /// Memory usage history
  final List<int> _memoryHistory = [];

  /// Whether monitoring is active
  bool _isMonitoring = false;

  /// Initialize performance monitoring
  void initialize(OtpPerformanceConfig config) {
    _config = config;

    if (config.enablePerformanceMonitoring) {
      _startMonitoring();
    }
  }

  /// Start performance monitoring
  void _startMonitoring() {
    if (_isMonitoring) return;

    _isMonitoring = true;

    // Monitor performance at regular intervals
    _monitoringTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _collectMetrics(),
    );

    // Monitor memory usage
    if (_config?.enableMemoryOptimization == true) {
      Timer.periodic(
        const Duration(seconds: 5),
        (_) => _trackMemoryUsage(),
      );
    }

    // Monitor animation performance
    if (_config?.enableAnimationOptimization == true) {
      _startAnimationTracking();
    }
  }

  /// Stop performance monitoring
  void stopMonitoring() {
    _isMonitoring = false;
    _monitoringTimer?.cancel();
    _monitoringTimer = null;
  }

  /// Collect performance metrics
  void _collectMetrics() {
    final metrics = <String, dynamic>{
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'memoryUsage': _getCurrentMemoryUsage(),
      'animationFPS': _calculateFPS(),
      'fieldCount': _getFieldCount(),
      'animationControllers': _getAnimationControllerCount(),
      'isLowMemory': _isLowMemory(),
      'recommendations': _getRecommendations(),
    };

    _metricsController.add(metrics);
  }

  /// Track memory usage
  void _trackMemoryUsage() {
    final memoryUsage = _getCurrentMemoryUsage();
    _memoryHistory.add(memoryUsage);

    // Keep only last 10 measurements
    if (_memoryHistory.length > 10) {
      _memoryHistory.removeAt(0);
    }

    _memoryController.add(memoryUsage);
  }

  /// Start animation performance tracking
  void _startAnimationTracking() {
    // This would typically be implemented with platform-specific code
    // For now, we'll simulate FPS tracking
    Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => _trackAnimationPerformance(),
    );
  }

  /// Track animation performance
  void _trackAnimationPerformance() {
    final now = DateTime.now();
    _frameTimes.add(now);

    // Keep only last 60 frame times (1 second at 60fps)
    if (_frameTimes.length > 60) {
      _frameTimes.removeAt(0);
    }

    // Calculate FPS
    if (_frameTimes.length > 1) {
      final fps = _calculateFPS();
      _animationController.add(fps);
    }
  }

  /// Calculate current FPS
  double _calculateFPS() {
    if (_frameTimes.length < 2) return 0.0;

    final timeSpan = _frameTimes.last.difference(_frameTimes.first);
    if (timeSpan.inMilliseconds == 0) return 0.0;

    return (_frameTimes.length - 1) * 1000 / timeSpan.inMilliseconds;
  }

  /// Get current memory usage (simulated)
  int _getCurrentMemoryUsage() {
    // In a real implementation, this would use platform-specific APIs
    // For now, we'll return a simulated value
    return 50 + (DateTime.now().millisecond % 50);
  }

  /// Get current field count (would be passed from widget)
  int _getFieldCount() {
    // This would be set by the widget when it's created
    return 4; // Default value
  }

  /// Get animation controller count (would be tracked by widget)
  int _getAnimationControllerCount() {
    // This would be tracked by the widget
    return 8; // Default value
  }

  /// Check if memory usage is low
  bool _isLowMemory() {
    if (_memoryHistory.isEmpty) return false;

    final avgMemory =
        _memoryHistory.reduce((a, b) => a + b) / _memoryHistory.length;
    return avgMemory > 80; // Threshold for low memory
  }

  /// Get performance recommendations
  List<String> _getRecommendations() {
    final recommendations = <String>[];

    if (_isLowMemory()) {
      recommendations.add('Consider reducing animation complexity');
      recommendations.add('Enable lazy loading for large field counts');
    }

    final fps = _calculateFPS();
    if (fps < 30) {
      recommendations
          .add('Animation performance is low, consider optimization');
    }

    if (_getAnimationControllerCount() > 10) {
      recommendations.add('Consider using animation pooling');
    }

    return recommendations;
  }

  /// Get performance summary
  Map<String, dynamic> getPerformanceSummary() {
    return {
      'isMonitoring': _isMonitoring,
      'currentMemoryUsage': _getCurrentMemoryUsage(),
      'averageMemoryUsage': _memoryHistory.isEmpty
          ? 0
          : _memoryHistory.reduce((a, b) => a + b) / _memoryHistory.length,
      'currentFPS': _calculateFPS(),
      'averageFPS': _frameTimes.length > 1 ? _calculateFPS() : 0.0,
      'fieldCount': _getFieldCount(),
      'animationControllerCount': _getAnimationControllerCount(),
      'isLowMemory': _isLowMemory(),
      'recommendations': _getRecommendations(),
    };
  }

  /// Optimize performance based on current metrics
  void optimizePerformance() {
    final summary = getPerformanceSummary();

    if (summary['isLowMemory'] == true) {
      _triggerMemoryCleanup();
    }

    if (summary['currentFPS'] < 30) {
      _triggerAnimationOptimization();
    }
  }

  /// Trigger memory cleanup
  void _triggerMemoryCleanup() {
    // This would trigger cleanup in the widget
    if (kDebugMode) {
      print('OtpPerformanceMonitor: Triggering memory cleanup');
    }
  }

  /// Trigger animation optimization
  void _triggerAnimationOptimization() {
    // This would trigger animation optimization in the widget
    if (kDebugMode) {
      print('OtpPerformanceMonitor: Triggering animation optimization');
    }
  }

  /// Dispose the monitor
  void dispose() {
    stopMonitoring();
    _metricsController.close();
    _memoryController.close();
    _animationController.close();
  }
}

/// Performance metrics data class
class PerformanceMetrics {
  final DateTime timestamp;
  final int memoryUsage;
  final double animationFPS;
  final int fieldCount;
  final int animationControllerCount;
  final bool isLowMemory;
  final List<String> recommendations;

  const PerformanceMetrics({
    required this.timestamp,
    required this.memoryUsage,
    required this.animationFPS,
    required this.fieldCount,
    required this.animationControllerCount,
    required this.isLowMemory,
    required this.recommendations,
  });

  factory PerformanceMetrics.fromMap(Map<String, dynamic> map) {
    return PerformanceMetrics(
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      memoryUsage: map['memoryUsage'] ?? 0,
      animationFPS: (map['animationFPS'] ?? 0.0).toDouble(),
      fieldCount: map['fieldCount'] ?? 0,
      animationControllerCount: map['animationControllerCount'] ?? 0,
      isLowMemory: map['isLowMemory'] ?? false,
      recommendations: List<String>.from(map['recommendations'] ?? []),
    );
  }
}

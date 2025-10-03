/// Configuration for performance optimizations
///
/// Provides settings for memory management, lazy loading, and performance tuning
/// to ensure optimal performance even with large field counts or complex animations.
class OtpPerformanceConfig {
  /// Creates a new performance configuration
  const OtpPerformanceConfig({
    this.enableLazyLoading = true,
    this.maxVisibleFields = 8,
    this.enableMemoryOptimization = true,
    this.animationCleanupDelay = const Duration(seconds: 5),
    this.enableAnimationPooling = true,
    this.maxAnimationPoolSize = 10,
    this.enableFieldRecycling = true,
    this.enableBackgroundCleanup = true,
    this.cleanupInterval = const Duration(minutes: 1),
    this.enablePerformanceMonitoring = false,
    this.enableMemoryLeakDetection = false,
    this.enableAnimationOptimization = true,
    this.enableWidgetOptimization = true,
  });

  /// Whether to enable lazy loading of fields
  final bool enableLazyLoading;

  /// Maximum number of visible fields before lazy loading kicks in
  final int maxVisibleFields;

  /// Whether to enable memory optimization
  final bool enableMemoryOptimization;

  /// Delay before cleaning up unused animations
  final Duration animationCleanupDelay;

  /// Whether to enable animation controller pooling
  final bool enableAnimationPooling;

  /// Maximum size of animation controller pool
  final int maxAnimationPoolSize;

  /// Whether to enable field widget recycling
  final bool enableFieldRecycling;

  /// Whether to enable background cleanup
  final bool enableBackgroundCleanup;

  /// Interval for background cleanup operations
  final Duration cleanupInterval;

  /// Whether to enable performance monitoring
  final bool enablePerformanceMonitoring;

  /// Whether to enable memory leak detection
  final bool enableMemoryLeakDetection;

  /// Whether to enable animation optimization
  final bool enableAnimationOptimization;

  /// Whether to enable widget optimization
  final bool enableWidgetOptimization;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpPerformanceConfig copyWith({
    bool? enableLazyLoading,
    int? maxVisibleFields,
    bool? enableMemoryOptimization,
    Duration? animationCleanupDelay,
    bool? enableAnimationPooling,
    int? maxAnimationPoolSize,
    bool? enableFieldRecycling,
    bool? enableBackgroundCleanup,
    Duration? cleanupInterval,
    bool? enablePerformanceMonitoring,
    bool? enableMemoryLeakDetection,
    bool? enableAnimationOptimization,
    bool? enableWidgetOptimization,
  }) {
    return OtpPerformanceConfig(
      enableLazyLoading: enableLazyLoading ?? this.enableLazyLoading,
      maxVisibleFields: maxVisibleFields ?? this.maxVisibleFields,
      enableMemoryOptimization:
          enableMemoryOptimization ?? this.enableMemoryOptimization,
      animationCleanupDelay:
          animationCleanupDelay ?? this.animationCleanupDelay,
      enableAnimationPooling:
          enableAnimationPooling ?? this.enableAnimationPooling,
      maxAnimationPoolSize: maxAnimationPoolSize ?? this.maxAnimationPoolSize,
      enableFieldRecycling: enableFieldRecycling ?? this.enableFieldRecycling,
      enableBackgroundCleanup:
          enableBackgroundCleanup ?? this.enableBackgroundCleanup,
      cleanupInterval: cleanupInterval ?? this.cleanupInterval,
      enablePerformanceMonitoring:
          enablePerformanceMonitoring ?? this.enablePerformanceMonitoring,
      enableMemoryLeakDetection:
          enableMemoryLeakDetection ?? this.enableMemoryLeakDetection,
      enableAnimationOptimization:
          enableAnimationOptimization ?? this.enableAnimationOptimization,
      enableWidgetOptimization:
          enableWidgetOptimization ?? this.enableWidgetOptimization,
    );
  }
}

/// Performance monitoring callback types
typedef PerformanceMetricsCallback = void Function(
    Map<String, dynamic> metrics);
typedef MemoryUsageCallback = void Function(int memoryUsage);
typedef AnimationPerformanceCallback = void Function(double fps);

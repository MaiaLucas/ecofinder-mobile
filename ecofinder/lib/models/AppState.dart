import 'package:meta/meta.dart';
import 'package:ecofinder/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final Auth auth;
  final AppTab activeTab;

  AppState({
    this.isLoading = false,
    this.activeTab = AppTab.dashboard,
    this.auth,
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    AppTab activeTab,
    Auth auth,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      activeTab: activeTab ?? this.activeTab,
      auth: auth ?? this.auth,
    );
  }

  @override
  int get hashCode => isLoading.hashCode ^ auth.hashCode ^ activeTab.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          activeTab == other.activeTab &&
          auth == other.auth;

  @override
  String toString() {
    return 'AppState{isLoading:$isLoading, auth:$auth, activeTab:$activeTab}';
  }
}

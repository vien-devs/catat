import 'package:catat/core/routing/core/page_wrapper.dart';
import 'package:flutter/material.dart';

/// Base page for all amartha page
/// Based on [MaterialPage] with minimal change
class BasePage<T> extends Page<T> {
  const BasePage({
    this.maintainState = true,
    this.fullscreenDialog = false,
    required super.key,
    required this.child,
    super.name,
    super.arguments,
    super.restorationId,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool fullscreenDialog;

  @override
  Route<T> createRoute(BuildContext context) {
    return _BasePageRoute<T>(page: this);
  }
}

class _BasePageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  _BasePageRoute({
    required BasePage<T> page,
  }) : super(settings: page) {
    assert(opaque);
  }

  BasePage<T> get _page => settings as BasePage<T>;

  @override
  Widget buildContent(BuildContext context) {
    // Wrap Child with PageWrapper
    return PageWrapper(child: _page.child);
  }

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}

import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Provide helper and utility function for debugging a page
class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({
    super.key,
    required this.child,
  });

  // List<DebugAction> _getAction() {
  //   return [
  //     DebugAction(
  //       title: 'Dev Ops',
  //       action: (context) => context.pushNamed(
  //         DevopsRoutes.main.name!,
  //       ),
  //     ),
  //   ];
  // }

  // void _showDebugMenu(BuildContext context) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (innnerContext) {
  //       return CupertinoActionSheet(
  //         actions: _getAction()
  //             .map((e) => CupertinoActionSheetAction(
  //                   onPressed: () {
  //                     Navigator.pop(innnerContext);
  //                     e.action(context);
  //                   },
  //                   child: Text(e.title),
  //                 ))
  //             .toList(),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      final screenType = child.runtimeType.toString();
      return Stack(
        children: [
          Positioned.fill(child: child),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    child: Text(
                      '($screenType)',
                      key: const Key('text-debug'),
                      style: context.textTheme.bodyMedium,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    // onLongPress: () {
                    //   _showDebugMenu(context);
                    // },
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return child;
  }
}

class DebugAction {
  DebugAction({
    required this.title,
    required this.action,
  });

  /// Action title
  final String title;

  /// On tap action
  final Function(BuildContext context) action;
}

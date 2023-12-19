import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressOverlay extends StatelessWidget {
  const ProgressOverlay({
    required this.show,
    super.key,
  });

  final bool show;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: show,
        child: AbsorbPointer(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ),
      );
}

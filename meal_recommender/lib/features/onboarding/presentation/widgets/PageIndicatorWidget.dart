import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;
  final int index;

  const PageIndicator({
    Key? key,
    required this.isActive,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing
        final double width = isActive
            ? constraints.maxWidth * 0.1 > 40
                ? 40
                : constraints.maxWidth * 0.1
            : constraints.maxWidth * 0.08 > 30
                ? 30
                : constraints.maxWidth * 0.08;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 12,
          width: width,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF0A2E60) : const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8),
            border: isActive ? Border.all(color: Colors.white, width: 1) : null,
          ),
        );
      },
    );
  }
}

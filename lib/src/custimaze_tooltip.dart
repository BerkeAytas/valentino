import 'package:flutter/material.dart';

class CustimazeTooltip extends StatelessWidget {
  const CustimazeTooltip({
    super.key,
    required this.context,
    required this.title,
    required this.widgetBool,
    this.widget,
  });

  final BuildContext context;
  final String title;
  final bool widgetBool;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
        final Size screenSize = overlay.size;
        final Offset target = details.globalPosition;
        const double tooltipWidth = 200.0;
        const double padding = 8.0;
        double left = target.dx;
        if (left + tooltipWidth + padding > screenSize.width) {
          left = screenSize.width - tooltipWidth - padding;
        }
        final entry = OverlayEntry(
          builder: (context) => Positioned(
            top: target.dy + 24,
            left: left,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: tooltipWidth,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: widgetBool
                    ? Text(
                        title,
                        style: const TextStyle(color: Colors.white),
                        softWrap: true,
                      )
                    : widget,
              ),
            ),
          ),
        );

        Overlay.of(context).insert(entry);

        Future.delayed(const Duration(seconds: 2), () {
          entry.remove();
        });
      },
      child: const Icon(Icons.info),
    );
  }
}

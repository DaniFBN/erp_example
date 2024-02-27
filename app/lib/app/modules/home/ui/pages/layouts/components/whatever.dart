import 'package:flutter/material.dart';

class LanguageButtonComponent extends StatefulWidget {
  final Widget target;
  final Widget follower;
  final Offset? offset;

  const LanguageButtonComponent({
    super.key,
    required this.target,
    required this.follower,
    this.offset,
  });

  @override
  State<LanguageButtonComponent> createState() =>
      _LanguageButtonComponentState();
}

class _LanguageButtonComponentState extends State<LanguageButtonComponent> {
  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlay;

  @override
  void dispose() {
    clearOverlay();

    super.dispose();
  }

  void clearOverlay() {
    overlay?.remove();
    overlay = null;
  }

  void showOptions() {
    if (overlay != null) return clearOverlay();

    overlay = OverlayEntry(
      builder: (context) {
        return CompositedTransformFollower(
          link: layerLink,
          offset: widget.offset ?? Offset.zero,
          child: widget.follower,
        );
      },
    );

    Overlay.of(context).insert(overlay!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: widget.target,
    );
  }
}

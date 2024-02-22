import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/intl_helper.dart';

class LanguageButtonComponent extends StatefulWidget {
  final IntlStore intlStore;

  const LanguageButtonComponent({
    super.key,
    required this.intlStore,
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
        final locales = appLocales(widget.intlStore.supportedLocales);

        return CompositedTransformFollower(
          link: layerLink,
          offset: const Offset(52, 0),
          child: Material(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: ListView.separated(
                    itemCount: locales.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    itemBuilder: (_, index) {
                      final locale = locales.elementAt(index);

                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              widget.intlStore.changeLocale(locale.locale);

                              clearOverlay();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                  if (locale.flagAssetPath.isNotEmpty) ...{
                                    Image.asset(
                                      locale.flagAssetPath,
                                      height: 20,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 8),
                                  },
                                  Text(locale.label),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlay!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: IconButton(
        onPressed: showOptions,
        icon: const Icon(Icons.translate_rounded),
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:l10n/l10n.dart';

import '../../../../domain/entities/packaging_entity.dart';
import '../../../stores/packaging_store.dart';

class PackagingsMobileLayout extends StatelessWidget {
  final PackagingStore packagingStore;
  final ThemeStore themeStore;

  const PackagingsMobileLayout({
    super.key,
    required this.packagingStore,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final translate = AppLocalizations.of(context);

    return MobileTemplateComponent(
      themeStore: themeStore,
      title: translate.packagings,
      body: ScopedBuilder(
        store: packagingStore,
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, List<PackagingEntity> state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ListView.separated(
                itemCount: state.length,
                shrinkWrap: true,
                separatorBuilder: (_, __) => const SizedBox(height: 4),
                itemBuilder: (_, index) {
                  final packaging = state.elementAt(index);

                  final size = MediaQuery.sizeOf(context);

                  return Card(
                    child: Container(
                      width: size.width * 0.8,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            packaging.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  packaging.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: r'R$',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    TextSpan(
                                      text: packaging.price.toStringAsFixed(2),
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    TextSpan(
                                      text: '/${packaging.amount} unidades',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigatorService.instance.push('/packaging/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:design_system/design_system.dart';
import 'package:design_system/src/widgets/fields/ds_internal_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:l10n/l10n.dart';

void main() {
  testWidgets('ds password field ...', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              final size = MediaQuery.sizeOf(context);
              Responsive.setSize(size);
              return DsPasswordField(
                controller: TextEditingController(),
                label: 'LABEL',
              );
            },
          ),
        ),
      ),
    );

    final labelFinder = find.text('LABEL');

    expect(labelFinder, findsOneWidget);
    expect(find.byType(DsInternalField), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is DsInternalField &&
            widget.isRequired == true &&
            widget.label == 'LABEL',
      ),
      findsOneWidget,
    );
  });
}

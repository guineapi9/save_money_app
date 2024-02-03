import 'package:flutter/material.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/common/widget/transparent_scaffold.dart';

class CenterDialogScaffold extends StatelessWidget {
  final Widget body;

  const CenterDialogScaffold({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return TransparentScaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
          decoration: BoxDecoration(
              color: context.colorScheme.background, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              body,
            ],
          ),
        ),
      ),
    );
  }
}

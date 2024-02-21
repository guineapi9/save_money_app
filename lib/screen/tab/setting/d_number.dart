import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:save_money_app/common/common.dart';

class NumberDialog extends DialogWidget<int> {
  NumberDialog({super.key});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends State<NumberDialog> {
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(child: Column(
            children: [
              "한달에 이정도 이상은 절대 안쓴다!".text.make(),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              const Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PostButton(
                      text: '취소',
                      backgroundColor: context.colorScheme.primaryContainer,
                      foregroundColor: context.colorScheme.onPrimaryContainer,
                      onPressed: () {
                        widget.hide();
                      }),
                  PostButton(text: '저장', onPressed: () {
                    widget.hide(IntExt.safeParse(numberController.text) ?? 0);
                  },),
                ],
              ),
            ],
          )),
        ],
      ).pSymmetric(h:20),
    );
  }
}

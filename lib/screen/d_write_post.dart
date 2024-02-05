import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/common/extension/datetime_extension.dart';
import 'package:save_money_app/screen/vo_write_post_result.dart';


class WritePostDialog extends DialogWidget {
  WritePostDialog({super.key});

  @override
  DialogState<WritePostDialog> createState() => _WritePostDialogState();
}

class _WritePostDialogState extends DialogState<WritePostDialog> {
  DateTime _selectedDate = DateTime.now(); //변할 수 있기 때문에 final 선언 안함
  final productController = TextEditingController();
  final priceController = TextEditingController();
  final reasonController = TextEditingController();
  final promiseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 제품(서비스)명
              "제품(서비스)명".text.color(context.appColors.text).bold.make(),
              _TextEditor(productController, hintText: "구매한 제품 혹은 서비스"),
              const Height(20),

              /// 구매일자
              "구매 일자".text.color(context.appColors.text).bold.make(),
              Row(
                children: [
                  Text(_selectedDate.formattedDate, style: context.textTheme.bodyMedium,),
                  IconButton(
                    onPressed: _selectDate,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              const Height(20),

              ///가격
              "가격".text.color(context.appColors.text).bold.make(),
              _TextEditor(priceController,
                  hintText: "금액(Won)", keyboardType: TextInputType.number),
              const Height(20),

              ///구매한 이유
              "구매한 이유".text.color(context.appColors.text).bold.make(),
              _TextEditor(reasonController, hintText: "왜 구매하셨나요?"),
              const Height(20),

              ///다짐
              "다짐".text.color(context.appColors.text).bold.make(),
              _TextEditor(promiseController, hintText: "반성 및 다짐"),
              const Height(20),

              ///버튼
              Row(
                children: [
                  PostButton(
                      text: '취소',
                      backgroundColor: context.colorScheme.primaryContainer,
                      foregroundColor: context.colorScheme.onPrimaryContainer,
                      onPressed: () {
                        widget.hide();
                      }),
                  const Spacer(),
                  PostButton(text: '저장', onPressed: () {
                    widget.hide(WritePostResult(
                      product: productController.text,
                      purchaseDate: _selectedDate,
                      price: IntExt.safeParse(priceController.text) ?? 0,
                      reason: reasonController.text,
                      promise: promiseController.text,
                    ));
                  }),
                ],
              ),
            ],
          ).p(20),
        ).pOnly(top: 100, bottom: 10, right: 30, left: 30),
      ),
    );
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate, //오늘
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }
}

class PostButton extends StatelessWidget {
  const PostButton({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colorScheme.primary,
        foregroundColor: foregroundColor ?? context.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // BorderRadius 설정
        ),
      ),
      child: Text(text),
    );
  }
}

class _TextEditor extends StatelessWidget {
  const _TextEditor(this.productController,
      {super.key, this.hintText, this.keyboardType});

  final TextEditingController productController;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.bodyLarge,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        // //포커싱 되었을 때의 테두리
        // focusedBorder: inputBorder ? OutlineInputBorder(
        //   borderRadius: BorderRadius.zero,
        //   borderSide: BorderSide(color: context.colorScheme.primary),
        // ) : null,

        //기본 테두리
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primaryContainer),
        ),
        hintText: hintText,
        hintStyle:
        TextStyle(
          color: context.appColors.text2
        ),

      ),
      controller: productController,
    );
  }
}

import 'package:get/get.dart';

class DeleteButtonHolder extends GetxController {
  RxBool isVisible = false.obs;

  void toggleVisible() {
    isVisible.toggle();
    isVisible.refresh();
  }
}

/// 상태 관리에 사용될 mixin
mixin class DeleteButtonProvider {
  ///DeleteButtonHolder 클래스의 인스턴스를 생성하고 late final을 사용하여 나중에 초기화될 것임을 선언
  ///Get.find() => 등록된 클래스를 찾아서 해당 클래스의 인스턴스를 반환
  late final DeleteButtonHolder buttonData = Get.find();
}


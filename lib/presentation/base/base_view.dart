import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

abstract class BaseView<T extends StateMixin<S>, S> extends GetView<T> {
  final String? viewTag;

  const BaseView({Key? key, this.viewTag}) : super(key: key);

  @override
  String? get tag {
    return viewTag;
  }

  Widget get viewContent => controller.obx(
        (state) => showMainView(state),
    onLoading: showLoadingWidget(),
    onError: (error) => showErrorWidget(error),
    onEmpty: showEmptyWidget(),
  );

  Widget showMainView(S? state);

  Widget showErrorWidget(String? error);

  Widget? showLoadingWidget() {
    return null; // if null, then the default loading widget will be rendered
  }

  Widget showEmptyWidget({bool refresh = true});

  @override
  Widget build(BuildContext context);
}
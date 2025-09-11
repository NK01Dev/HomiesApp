import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homies_app/core/utils/textStyleHelper.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/presentation/auth/register/regiser_viewmodel.dart';
import 'package:homies_app/presentation/base/base_view.dart';

class RegisterView extends BaseView<RegiserViewmodel, UserEntity> {
  final responsiveTextStyle = TextStyleHelper.textStyle18(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return viewContent;
  }

  @override
  Widget showEmptyWidget({bool refresh = true}) {
    // TODO: implement showEmptyWidget
return Scaffold(
  body: Center(child: Text("showEmptyWidget",style: responsiveTextStyle,),),
);  }

  @override
  Widget showErrorWidget(String? error) {
    // TODO: implement showErrorWidget
    return Scaffold(
      body: Center(child: Text("showErrorWidget",style: responsiveTextStyle,),),
    );  }

  @override
  Widget showMainView(UserEntity? state) {
    // TODO: implement showMainView
return Scaffold(
  appBar: AppBar(),
  body: SingleChildScrollView(
    child: Center(
      child: Column(),
    ),
  ),
);  }


}

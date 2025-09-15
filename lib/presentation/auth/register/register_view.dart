import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Center(child: Text("showEmptyWidget", style: responsiveTextStyle)),
    );
  }

  @override
  Widget showErrorWidget(String? error) {
    // TODO: implement showErrorWidget
    return Scaffold(
      body: Center(child: Text("showErrorWidget", style: responsiveTextStyle)),
    );
  }

  @override
  Widget showMainView(UserEntity? state) {
    // TODO: implement showMainView
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 24.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.w), // Responsive padding
              child: Text(
                "Register",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h,),
            Form(
                key: controller.formKey,

                child: Padding(
                  padding: EdgeInsets.all(20.w), // Responsive padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,

                    children: [
                      Text('Username',style: TextStyleHelper.textStyle24(),),
                      SizedBox(height: 10.sp,),
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                            hintText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(color: Colors.black, width: 4.sp),

                          ),
                          // prefixIcon: Icon(Icons.clear)

                        ),
                      ),

                    ],
                  ),
                ))

          ],
        ),
      ),
    );
  }
}

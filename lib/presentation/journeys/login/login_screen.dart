import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../widgets/widgets.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Sizes.dimen_32.h),
                child: Logo(
                  height: Sizes.dimen_12.h,
                ),
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

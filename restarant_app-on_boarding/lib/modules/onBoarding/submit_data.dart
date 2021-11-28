import 'dart:js';

import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/navigator/navigate_and_finish.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';

class SubmitData {
  void submitData() {
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
      print('hello');
      NavigateAndFinish().navigateAndFinish(context, SignIn());
    });
  }
}

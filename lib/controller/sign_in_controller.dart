
import 'package:get/get.dart';

import '../services/base_client.dart';
import 'base_controller.dart';

class SignInController extends GetxController with BaseController {
  // var loginData = <Data>[].obs;
  

  getData(String username, String password) async {
    showLoading('Authenticating data...');
    var response = await BaseClient()
        .get('https://winnerssacco.org/admin/api/api',
            '/employee/app_login.php?username=$username&password=$password')
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    // print(response);
  
    return response;
  }

  getData2(String username) async {
    showLoading('Authenticating data...');
    var response = await BaseClient()
        .get('https://winnerssacco.org/admin/api/api',
        '/employee/register_app.php?username=$username')
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    // print(response);

    return response;
  }
}

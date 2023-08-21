import 'dart:convert';

import 'package:http/http.dart';

class LoginRepository {

  String loginUrl = "https://vendurs.cmsbox.in/api/user-login";

  Future login(String email, password) async {
    try {
      Response response = await post(Uri.parse(loginUrl),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        // Navigator.pushNamed(context, 'homepage');
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text("Registered Successfully"),
        // ));
      } else {
        print('failed' + "" + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
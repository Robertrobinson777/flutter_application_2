import 'package:dio/dio.dart';

import '../model/user_model.dart';

final dio = Dio();

class UserService {
  Future<UserDetails> getUserDetails() async {
    final dynamic response =
        await dio.get('https://jsonplaceholder.typicode.com/posts/1');

    return UserDetails.fromJson(response.data);
  }
}

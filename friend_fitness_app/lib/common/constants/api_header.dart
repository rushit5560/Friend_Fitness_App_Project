import 'package:friend_fitness_app/common/user_details.dart';

class ApiHeader {

  Map<String, String> headers = <String,String>{
    'token': UserDetails.userIdToken
  };

}
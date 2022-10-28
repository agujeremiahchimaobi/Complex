import 'package:complex/model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<Users>> getUsers() async {
    const uri = 'https://jsonplaceholder.typicode.com/users';

    final request = await http.get(Uri.parse(uri));

    if (request.statusCode == 200) {
      final body = request.body;
      final users = usersFromJson(body);
      return users;
    } else {
      final req = request.body;
      final error = usersFromJson(req);
      return error;
    }
  }
}

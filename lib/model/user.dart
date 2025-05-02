import 'package:http/http.dart' as http;
import 'dart:convert';

class VapiCallService {
  final String apiKey = '35e637e2-9d39-4cb1-aca3-9b520f6d9c5b';
  final String assistantId = '80fee333-2dd7-4b64-91b4-0ec950b35dbb';
  final String phoneNumberId = '51fb11d9-0a2d-4df6-b84d-78823658ca2b';

  Future<void> makeOutboundCall(String customerNumber) async {
    final url = Uri.parse('https://api.vapi.ai/call');

    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'phoneNumberId': phoneNumberId,
      'assistantId': assistantId,
      'customer': {
        'number': customerNumber,
      },
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Call initiated successfully.');
    } else {
      print('Failed to initiate call: ${response.body}');
    }
  }
}

class User {
  final String phone;
  final String name;

  User({required this.phone, required this.name});

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     phone: json['phone'],
  //     name: json['name'],
  //   );
  // }
}

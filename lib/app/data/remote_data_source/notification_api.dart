import 'dart:convert';

import 'package:http/http.dart' as http;

class NotificationApis{
  void sendPushMessage(String body, String title, String token) async {
    try {
      http.Response response= await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          // 'key=AIzaSyBpaqzorW0S3p9Jot7rjpwFmr0L0DGW_RA',
          'key=AAAA-5dusE8:APA91bGFf3EUvPOqBsukd1BcCOgyJlLGNTgvZ7UcqyGpgDyH5UBRV-uoxKwORmPJVO5BoIodDxKPo-MqTBkfic_4cVfg4uNYk79HEiHySyTlBAQbzmSotPd4V3pNneeVspnSLafKLgYO'
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      print('done  =>'+response.body.toString());
    } catch (e) {
      print("error push notification"+e.toString());
    }
  }
}
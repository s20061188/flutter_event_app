import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import './models/form.dart';

// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbzJ-SrtHormSKRI5ExDYH0kx0PH_mxTVwaev6VrTMByVeZLJQDATMqhWBU1mUSVWKt4Jg/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves rsvpForm, parses [RsvpForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(RsvpForm form, void Function(String) callback) async {
    try {
      await http.post(URL, body: form.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

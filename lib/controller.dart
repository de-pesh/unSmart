import 'dart:convert' as convert;
import 'package:myapp/models/feedback.dart';
import 'package:http/http.dart' as http;

class FormController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  // ignore: constant_identifier_names
  static const String URL =
      "https://script.google.com/macros/s/AKfycbyPLCVPyl-YxQsY5QR6rHGNds6tDHPKRvqLGpgu0dFrMZzRCtTv2P4HjyJX4kD6pFRY0g/exec";

  // ignore: constant_identifier_names
  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(URL + feedbackForm.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      //print(e);
    }
  }
}

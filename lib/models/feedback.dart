class FeedbackForm {
  final String _status;

  FeedbackForm(this._status);

  // Method to make GET parameters.
  String toParams() => "?name=$_status";
}

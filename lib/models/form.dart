class RsvpForm {
  String name;
  String mobileNo;
  String email;
  String response;

  RsvpForm(this.name, this.mobileNo, this.email, this.response);

  factory RsvpForm.fromJson(dynamic json) {
    return RsvpForm("${json['name']}", "${json['mobileNo']}",
        "${json['email']}", "${json['response']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': name,
        'mobileNo': mobileNo,
        'email': email,
        'response': response
      };
}

class OtpModel {
  bool? success;
  String? message;
  String? o;
  int? code;

  OtpModel({this.success, this.message, this.o, this.code});

  OtpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    o = json['o'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['o'] = this.o;
    data['code'] = this.code;
    return data;
  }
}

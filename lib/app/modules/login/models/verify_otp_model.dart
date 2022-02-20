class VerifyOtpRequestModel {
  String? mobileNumber;
  String? otp;

  VerifyOtpRequestModel({this.mobileNumber, this.otp});

  VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['otp'] = this.otp;
    return data;
  }
}

class VerifyOtpResponseModel {
  bool? success;
  String? message;
  int? code;
  UserData? userData;

  VerifyOtpResponseModel(
      {this.success, this.message, this.code, this.userData});

  VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? lastName;
  String? mobileNumber;
  String? city;
  String? age;
  String? gender;
  String? email;
  String? company;
  Null suggestYourIdea;
  List<String>? categories;
  String? subscriptionType;
  bool? subscriptionIsActive;
  bool? isEventManager;
  Null profileImage;
  Null productImages;
  List<String>? priceRange;
  int? groupid;
  String? authToken;

  UserData(
      {this.id,
      this.name,
      this.lastName,
      this.mobileNumber,
      this.city,
      this.age,
      this.gender,
      this.email,
      this.company,
      this.suggestYourIdea,
      this.categories,
      this.subscriptionType,
      this.subscriptionIsActive,
      this.isEventManager,
      this.profileImage,
      this.productImages,
      this.priceRange,
      this.groupid,
      this.authToken});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    city = json['city'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    company = json['company'];
    suggestYourIdea = json['suggestYourIdea'];
    categories = json['categories'].cast<String>();
    subscriptionType = json['subscriptionType'];
    subscriptionIsActive = json['subscriptionIsActive'];
    isEventManager = json['isEventManager'];
    profileImage = json['profileImage'];
    productImages = json['productImages'];
    priceRange = json['price_range'].cast<String>();
    groupid = json['groupid'];
    authToken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['mobileNumber'] = this.mobileNumber;
    data['city'] = this.city;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['company'] = this.company;
    data['suggestYourIdea'] = this.suggestYourIdea;
    data['categories'] = this.categories;
    data['subscriptionType'] = this.subscriptionType;
    data['subscriptionIsActive'] = this.subscriptionIsActive;
    data['isEventManager'] = this.isEventManager;
    data['profileImage'] = this.profileImage;
    data['productImages'] = this.productImages;
    data['price_range'] = this.priceRange;
    data['groupid'] = this.groupid;
    data['authToken'] = this.authToken;
    return data;
  }
}

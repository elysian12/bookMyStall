class FavouriteModel {
  int? eventID;
  String? mobileNumber;
  bool? isFavorite;

  FavouriteModel({this.eventID, this.mobileNumber, this.isFavorite});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    mobileNumber = json['mobileNumber'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['mobileNumber'] = this.mobileNumber;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class FavouriteResponseModel {
  bool? success;
  String? message;
  int? code;

  FavouriteResponseModel({this.success, this.message, this.code});

  FavouriteResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

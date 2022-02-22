class EventsModel {
  bool? success;
  String? message;
  int? code;
  List<Data>? data;
  List<CityBanners>? cityBanners;

  EventsModel(
      {this.success, this.message, this.code, this.data, this.cityBanners});

  EventsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['cityBanners'] != null) {
      cityBanners = <CityBanners>[];
      json['cityBanners'].forEach((v) {
        cityBanners!.add(new CityBanners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.cityBanners != null) {
      data['cityBanners'] = this.cityBanners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? eventID;
  String? referenceID;
  String? eventManagerId;
  String? mobileNumber;
  String? city;
  String? alternateMobileNumber;
  String? eventName;
  String? fromTime;
  String? toTime;
  Venue? venue;
  String? totalNoOfStalls;
  String? noOfStallsAvaliable;
  List<StallDetails>? stallDetails;
  List<String>? categories;
  List<String>? facilities;
  String? organizerMessage;
  String? minExpectedVisitors;
  String? visitors;
  String? lastUpdatedTime;
  bool? isApproved;
  String? imageURL1;
  String? imageURL2;
  String? leads;
  int? maxLeads;
  String? pendingLeads;
  List<String>? eventType;
  String? venueType;
  List<StandeeBannerDetails>? standeeBannerDetails;
  bool? isFavorited;
  Chat? chat;

  Data(
      {this.eventID,
      this.referenceID,
      this.eventManagerId,
      this.mobileNumber,
      this.city,
      this.alternateMobileNumber,
      this.eventName,
      this.fromTime,
      this.toTime,
      this.venue,
      this.totalNoOfStalls,
      this.noOfStallsAvaliable,
      this.stallDetails,
      this.categories,
      this.facilities,
      this.organizerMessage,
      this.minExpectedVisitors,
      this.visitors,
      this.lastUpdatedTime,
      this.isApproved,
      this.imageURL1,
      this.imageURL2,
      this.leads,
      this.maxLeads,
      this.pendingLeads,
      this.eventType,
      this.venueType,
      this.standeeBannerDetails,
      this.isFavorited,
      this.chat});

  Data.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    referenceID = json['referenceID'];
    eventManagerId = json['eventManagerId'];
    mobileNumber = json['mobileNumber'];
    city = json['city'];
    alternateMobileNumber = json['alternateMobileNumber'];
    eventName = json['eventName'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    totalNoOfStalls = json['totalNoOfStalls'];
    noOfStallsAvaliable = json['noOfStallsAvaliable'];
    if (json['stallDetails'] != null) {
      stallDetails = <StallDetails>[];
      json['stallDetails'].forEach((v) {
        stallDetails!.add(new StallDetails.fromJson(v));
      });
    }
    categories = json['categories'].cast<String>();
    facilities = json['facilities'].cast<String>();
    organizerMessage = json['organizerMessage'];
    minExpectedVisitors = json['minExpectedVisitors'];
    visitors = json['visitors'];
    lastUpdatedTime = json['lastUpdatedTime'];
    isApproved = json['isApproved'];
    imageURL1 = json['imageURL1'];
    imageURL2 = json['imageURL2'];
    leads = json['leads'];
    maxLeads = json['maxLeads'];
    pendingLeads = json['pendingLeads'];
    eventType = json['eventType'].cast<String>();
    venueType = json['venueType'];
    if (json['standeeBannerDetails'] != null) {
      standeeBannerDetails = <StandeeBannerDetails>[];
      json['standeeBannerDetails'].forEach((v) {
        standeeBannerDetails!.add(new StandeeBannerDetails.fromJson(v));
      });
    }
    isFavorited = json['isFavorited'];
    chat = json['chat'] != null ? new Chat.fromJson(json['chat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['referenceID'] = this.referenceID;
    data['eventManagerId'] = this.eventManagerId;
    data['mobileNumber'] = this.mobileNumber;
    data['city'] = this.city;
    data['alternateMobileNumber'] = this.alternateMobileNumber;
    data['eventName'] = this.eventName;
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    data['totalNoOfStalls'] = this.totalNoOfStalls;
    data['noOfStallsAvaliable'] = this.noOfStallsAvaliable;
    if (this.stallDetails != null) {
      data['stallDetails'] = this.stallDetails!.map((v) => v.toJson()).toList();
    }
    data['categories'] = this.categories;
    data['facilities'] = this.facilities;
    data['organizerMessage'] = this.organizerMessage;
    data['minExpectedVisitors'] = this.minExpectedVisitors;
    data['visitors'] = this.visitors;
    data['lastUpdatedTime'] = this.lastUpdatedTime;
    data['isApproved'] = this.isApproved;
    data['imageURL1'] = this.imageURL1;
    data['imageURL2'] = this.imageURL2;
    data['leads'] = this.leads;
    data['maxLeads'] = this.maxLeads;
    data['pendingLeads'] = this.pendingLeads;
    data['eventType'] = this.eventType;
    data['venueType'] = this.venueType;
    data['standeeBannerDetails'] = this.standeeBannerDetails;
    data['isFavorited'] = this.isFavorited;
    if (this.chat != null) {
      data['chat'] = this.chat!.toJson();
    }
    return data;
  }
}

class Venue {
  String? id;
  String? firstLine;
  String? secondLine;
  String? city;
  String? pinCode;
  String? latitude;
  String? longitude;
  String? venueType;

  Venue(
      {this.id,
      this.firstLine,
      this.secondLine,
      this.city,
      this.pinCode,
      this.latitude,
      this.longitude,
      this.venueType});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstLine = json['firstLine'];
    secondLine = json['secondLine'];
    city = json['city'];
    pinCode = json['pinCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    venueType = json['venueType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstLine'] = this.firstLine;
    data['secondLine'] = this.secondLine;
    data['city'] = this.city;
    data['pinCode'] = this.pinCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['venueType'] = this.venueType;
    return data;
  }
}

class StallDetails {
  String? typeOfStall;
  String? pricePerDay;
  String? pricePerEvent;
  String? lastUpdatedTime;
  String? tables;
  String? chairs;
  String? stallModel;

  StallDetails(
      {this.typeOfStall,
      this.pricePerDay,
      this.pricePerEvent,
      this.lastUpdatedTime,
      this.tables,
      this.chairs,
      this.stallModel});

  StallDetails.fromJson(Map<String, dynamic> json) {
    typeOfStall = json['typeOfStall'];
    pricePerDay = json['pricePerDay'];
    pricePerEvent = json['pricePerEvent'];
    lastUpdatedTime = json['lastUpdatedTime'];
    tables = json['tables'];
    chairs = json['chairs'];
    stallModel = json['stallModel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeOfStall'] = this.typeOfStall;
    data['pricePerDay'] = this.pricePerDay;
    data['pricePerEvent'] = this.pricePerEvent;
    data['lastUpdatedTime'] = this.lastUpdatedTime;
    data['tables'] = this.tables;
    data['chairs'] = this.chairs;
    data['stallModel'] = this.stallModel;
    return data;
  }
}

class Chat {
  String? status;
  int? pendingRequests;
  String? chatId;
  int? isAppInstalled;

  Chat({this.status, this.pendingRequests, this.chatId, this.isAppInstalled});

  Chat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pendingRequests = json['pending_requests'];
    chatId = json['chat_id'];
    isAppInstalled = json['isAppInstalled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['pending_requests'] = this.pendingRequests;
    data['chat_id'] = this.chatId;
    data['isAppInstalled'] = this.isAppInstalled;
    return data;
  }
}

class CityBanners {
  String? bannerImage;
  Null? eventData;

  CityBanners({this.bannerImage, this.eventData});

  CityBanners.fromJson(Map<String, dynamic> json) {
    bannerImage = json['bannerImage'];
    eventData = json['eventData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerImage'] = this.bannerImage;
    data['eventData'] = this.eventData;
    return data;
  }
}

class StandeeBannerDetails {
  String? cost;
  String? description;

  StandeeBannerDetails({this.cost, this.description});

  StandeeBannerDetails.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['description'] = this.description;
    return data;
  }
}

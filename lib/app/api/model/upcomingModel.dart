class UpcomingModel {
  bool? error;
  String? message;
  List<Data>? data;

  UpcomingModel({this.error, this.message, this.data});

  UpcomingModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? tourId;
  String? tourImage;
  String? tourTitle;
  String? tourTheme;
  String? tourCategory;
  String? tourCode;
  String? batchId;
  String? batchStartDate;
  String? batchEndDate;
  String? batchCode;
  String? batchLimit;
  String? batchFee;
  String? batchBooking;

  Data(
      {this.tourId,
        this.tourImage,
        this.tourTitle,
        this.tourTheme,
        this.tourCategory,
        this.tourCode,
        this.batchId,
        this.batchStartDate,
        this.batchEndDate,
        this.batchCode,
        this.batchLimit,
        this.batchFee,
        this.batchBooking});

  Data.fromJson(Map<String, dynamic> json) {
    tourId = json['tour_id'];
    tourImage = json['tour_image'];
    tourTitle = json['tour_title'];
    tourTheme = json['tour_theme'];
    tourCategory = json['tour_category'];
    tourCode = json['tour_code'];
    batchId = json['batch_id'];
    batchStartDate = json['batch_start_date'];
    batchEndDate = json['batch_end_date'];
    batchCode = json['batch_code'];
    batchLimit = json['batch_limit'];
    batchFee = json['batch_fee'];
    batchBooking = json['batch_booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tour_id'] = tourId;
    data['tour_image'] = tourImage;
    data['tour_title'] = tourTitle;
    data['tour_theme'] = tourTheme;
    data['tour_category'] = tourCategory;
    data['tour_code'] = tourCode;
    data['batch_id'] = batchId;
    data['batch_start_date'] = batchStartDate;
    data['batch_end_date'] = batchEndDate;
    data['batch_code'] = batchCode;
    data['batch_limit'] = batchLimit;
    data['batch_fee'] = batchFee;
    data['batch_booking'] = batchBooking;
    return data;
  }
}

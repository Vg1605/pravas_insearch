class LoginModel {
  bool? error;
  String? message;
  Data? data;

  LoginModel({this.error, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? brand_logo;
  String? brand_name;
  String? brandId;
  String? brandContactNo;
  String? mailtoBrandEmailId;
  String? brandAddress;

  Data(
      {this.brand_logo,
        this.brand_name,
        this.brandId,
        this.brandContactNo,
        this.mailtoBrandEmailId,
        this.brandAddress});

  Data.fromJson(Map<String, dynamic> json) {
    brand_logo = json['brand_logo'];
    brand_name = json['brand_name'];
    brandId = json['brand_id'];
    brandContactNo = json['brand_contact_no'];
    mailtoBrandEmailId = json['mailto:brand_email_id'];
    brandAddress = json['brand_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_logo'] = brand_logo;
    data['brand_name'] = brand_name;
    data['brand_id'] = brandId;
    data['brand_contact_no'] = brandContactNo;
    data['mailto:brand_email_id'] = mailtoBrandEmailId;
    data['brand_address'] = brandAddress;
    return data;
  }
}

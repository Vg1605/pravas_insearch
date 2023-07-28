class TourResponse {
  bool error;
  String message;
  TourData data;

  TourResponse({required this.error, required this.message, required this.data});

  factory TourResponse.fromJson(Map<String, dynamic> json) {
    return TourResponse(
      error: json['error'],
      message: json['message'],
      data: TourData.fromJson(json['data']),
    );
  }
}

class TourData {
  List<TourItinerary> tourItineary;

  TourData({required this.tourItineary});

  factory TourData.fromJson(Map<String, dynamic> json) {
    return TourData(
      tourItineary: List<TourItinerary>.from(
        json['tour_itineary'].map((itineary) => TourItinerary.fromJson(itineary)),
      ),
    );
  }
}

class TourItinerary {
  String title;
  String desc;

  TourItinerary({required this.title, required this.desc});

  factory TourItinerary.fromJson(Map<String, dynamic> json) {
    return TourItinerary(
      title: json['title'],
      desc: json['desc'],
    );
  }
}

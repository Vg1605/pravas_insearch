class ParticipantsResponse {
  bool error;
  String message;
  List<ParticipantData> data;

  ParticipantsResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory ParticipantsResponse.fromJson(Map<String, dynamic> json) {
    var participantsList = json['data'] as List;
    List<ParticipantData> participantsData = participantsList
        .map((participantJson) => ParticipantData.fromJson(participantJson))
        .toList();

    return ParticipantsResponse(
      error: json['error'],
      message: json['message'],
      data: participantsData,
    );
  }
}

class ParticipantData {
  String paymentStatus;
  String totalBillAmount;
  String totalPaidAmount;
  String totalRemainingAmount;
  String pId;
  String name;
  String contactNo;
  String emailId;
  String gender;

  ParticipantData({
    required this.paymentStatus,
    required this.totalBillAmount,
    required this.totalPaidAmount,
    required this.totalRemainingAmount,
    required this.pId,
    required this.name,
    required this.contactNo,
    required this.emailId,
    required this.gender,
  });

  factory ParticipantData.fromJson(Map<String, dynamic> json) {
    return ParticipantData(
      paymentStatus: json['payment_status'],
      totalBillAmount: json['total_bill_amt'],
      totalPaidAmount: json['total_paid_amt'],
      totalRemainingAmount: json['total_remaining_amt'],
      pId: json['p_id'],
      name: json['name'],
      contactNo: json['contact_no'] ?? "",
      emailId: json['email_id'] ?? "",
      gender: json['gender'],
    );
  }
}

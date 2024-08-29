class IResponse {
  final String status;
  final String? message;
  final dynamic data;

  const IResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory IResponse.fromJson(Map<String, dynamic> json) => IResponse(
        status: json['status'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

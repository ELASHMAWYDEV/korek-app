class UserModel {
  final String id;
  final String email;
  final String countryCode;
  final String phoneNumber;
  final String type;
  final double wallet;

  UserModel({
    required this.id,
    required this.email,
    required this.countryCode,
    required this.phoneNumber,
    required this.type,
    required this.wallet,
  });

  factory UserModel.fromJson(final json) => UserModel(
        id: json["id"],
        email: json["email"],
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
        type: json["type"],
        wallet: json["wallet"],
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'countryCode': countryCode});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'type': type});
    result.addAll({'wallet': wallet});

    return result;
  }
}

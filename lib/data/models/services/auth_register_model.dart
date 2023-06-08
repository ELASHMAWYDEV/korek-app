class AuthRegisterModel {
  final String name;
  final String email;
  final String countryCode;
  final String phoneNumber;
  final String password;
  final CarModel car;

  AuthRegisterModel({
    required this.name,
    required this.email,
    required this.countryCode,
    required this.phoneNumber,
    required this.password,
    required this.car,
  });

  factory AuthRegisterModel.fromJson(final json) => AuthRegisterModel(
        name: json["name"],
        email: json["email"],
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        car: json["car"],
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'countryCode': countryCode});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'password': password});
    result.addAll({'car': car.toMap()});

    return result;
  }
}

class CarModel {
  final String brand;
  final String model;
  final String vendor;
  final int year;
  final String plateNumber;
  final String chassisNumber;
  final String licenseImageFront;
  final String licenseImageBack;
  final String carImage;

  CarModel({
    required this.brand,
    required this.model,
    required this.vendor,
    required this.year,
    required this.plateNumber,
    required this.chassisNumber,
    required this.licenseImageFront,
    required this.licenseImageBack,
    required this.carImage,
  });

  factory CarModel.fromJson(final json) => CarModel(
        brand: json["brand"],
        model: json["model"],
        vendor: json["vendor"],
        year: json["year"],
        plateNumber: json["plateNumber"],
        chassisNumber: json["chassisNumber"],
        licenseImageFront: json["licenseImageFront"],
        licenseImageBack: json["licenseImageBack"],
        carImage: json["carImage"],
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'brand': brand});
    result.addAll({'model': model});
    result.addAll({'vendor': vendor});
    result.addAll({'year': year});
    result.addAll({'plateNumber': plateNumber});
    result.addAll({'chassisNumber': chassisNumber});
    result.addAll({'licenseImageFront': licenseImageFront});
    result.addAll({'licenseImageBack': licenseImageBack});
    result.addAll({'carImage': carImage});

    return result;
  }
}

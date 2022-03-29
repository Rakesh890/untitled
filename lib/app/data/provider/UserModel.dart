class UserModel {
  final bool? success;
  final Data? data;
  final String? message;

  UserModel({
    this.success,
    this.data,
    this.message,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data?.toJson(),
    'message' : message
  };
}

class Data {
  final UserDetails? userDetails;
  final String? token;

  Data({
    this.userDetails,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json)
      : userDetails = (json['user_details'] as Map<String,dynamic>?) != null ? UserDetails.fromJson(json['user_details'] as Map<String,dynamic>) : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'user_details' : userDetails?.toJson(),
    'token' : token
  };
}

class UserDetails {
  final int? id;
  final String? name;
  final String? fullName;
  final String? email;
  final String? mobileNo;
  final dynamic emailVerifiedAt;
  final String? gender;
  final String? dob;
  final String? createdAt;
  final String? updatedAt;

  UserDetails({
    this.id,
    this.name,
    this.fullName,
    this.email,
    this.mobileNo,
    this.emailVerifiedAt,
    this.gender,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  UserDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        fullName = json['full_name'] as String?,
        email = json['email'] as String?,
        mobileNo = json['mobile_no'] as String?,
        emailVerifiedAt = json['email_verified_at'],
        gender = json['gender'] as String?,
        dob = json['dob'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'full_name' : fullName,
    'email' : email,
    'mobile_no' : mobileNo,
    'email_verified_at' : emailVerifiedAt,
    'gender' : gender,
    'dob' : dob,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
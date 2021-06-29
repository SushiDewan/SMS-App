
import 'dart:convert';

AdminRegisterModel adminRegisterModelFromJson(String str) => AdminRegisterModel.fromJson(json.decode(str));

String adminRegisterModelToJson(AdminRegisterModel data) => json.encode(data.toJson());

class AdminRegisterModel {
    AdminRegisterModel({
        this.success,
        this.statusCode,
        this.message,
        this.admin,
    });

    bool success;
    int statusCode;
    String message;
    Admin admin;

    factory AdminRegisterModel.fromJson(Map<String, dynamic> json) => AdminRegisterModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        admin: Admin.fromJson(json["admin"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "admin": admin.toJson(),
    };
}

class Admin {
    Admin({
        this.user,
        this.schoolId,
    });

    User user;
    int schoolId;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        user: User.fromJson(json["user"]),
        schoolId: json["school_id"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "school_id": schoolId,
    };
}

class User {
    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.contactNumber,
        this.address,
        this.role,
        this.ednNumber,
        this.username,
        this.password,
    });

    int id;
    String firstName;
    String lastName;
    String email;
    int contactNumber;
    String address;
    int role;
    String ednNumber;
    String username;
    String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        contactNumber: json["contact_number"],
        address: json["address"],
        role: json["role"],
        ednNumber: json["edn_number"],
        username: json["username"],
        password: json["password"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "contact_number": contactNumber,
        "address": address,
        "role": role,
        "edn_number": ednNumber,
        "username": username,
        "password" : password,
    };
}

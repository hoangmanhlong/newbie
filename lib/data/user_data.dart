import 'package:json_annotation/json_annotation.dart';

/// Running the code generation utility
/// One-time code generation: dart run build_runner build --delete-conflicting-outputs
/// Generating code continuously: dart run build_runner watch --delete-conflicting-outputs

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user_data.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class UserData {

  String? uid;

  @JsonKey(name: 'user_name')
  String? userName;

  String? email;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  UserData({this.uid, this.email, this.userName, this.phoneNumber, this.avatarUrl});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserDataFromJson()` constructor.
  /// The constructor is named after the source class, in this case,
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserDataToJson`.
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.freezed.dart';
part 'credential.g.dart';

@freezed
class Credential with _$Credential {
  const factory Credential({
    String? firstname,
    String? lastname,
    String? barangay,
    required String email,
    String? password,
  }) = _Credential;

  factory Credential.fromJson(Map<String, Object?> json) =>
      _$CredentialFromJson(json);
}

class ProfileEntity {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String profileImageUrl;

  ProfileEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.profileImageUrl,
  });
}
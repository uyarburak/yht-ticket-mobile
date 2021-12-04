class ProfileResponse {
  final String email;
  final String name;
  final String? photo;
  final int credits;
  ProfileResponse({
    required this.email,
    required this.name,
    this.photo,
    required this.credits,
  });
}

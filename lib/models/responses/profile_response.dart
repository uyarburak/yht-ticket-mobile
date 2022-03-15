class ProfileResponse {
  final String email;
  final String name;
  final String photo;
  final int credits;
  final bool isGuest;

  ProfileResponse({
    required this.email,
    required this.name,
    required this.photo,
    required this.credits,
    required this.isGuest,
  });
}

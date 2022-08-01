// i named it userData since 'User' keyword has been used by firebase auth

class UserData {
  final String userId;
  final String username;
  final String email;
  final DateTime createdAt;

  UserData({
    required this.userId,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "createdAt": createdAt,
      };
}

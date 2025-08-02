class CreatUserReq {
  final String email;
  final String password;
  final String name;

  CreatUserReq({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'name': name};
  }
}

class LoginRequestDto {
  final String? email;
  final String? password;
  LoginRequestDto({
    this.email,
    this.password,
  });
   Map<String, dynamic> toJson() => {
    'username': email,
    'password': password,
  };

  // Create a model instance from a JSON map
  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return LoginRequestDto(
      email: json['username'] as String?,
      password: json['password'] as String?,
    );
  }

}
class ErrorModel {
  const ErrorModel({
    this.message,
    this.stack,
  });

  final String? message;
  final String? stack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['stack'] = stack;
    return map;
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      message: map['message'] != null ? map['message'].toString() : 'message',
      stack: map['stack'] != null ? map['stack'].toString() : 'stack',
    );
  }
}

class DeleteCartResponse {
  final bool? isDeleted;
  
  DeleteCartResponse({
    this.isDeleted,
  });
  
  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCartResponse(
      isDeleted: json['isDeleted'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'isDeleted': isDeleted,
    };
  }
}
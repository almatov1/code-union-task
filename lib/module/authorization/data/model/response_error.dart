class ResponseError {
  String? name;
  String? message;
  int? status;
  List? errors;

  ResponseError({this.name, this.message, this.status, this.errors});

  ResponseError.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    message = json['message'];
    status = json['status'];
    errors = json['errors'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['message'] = message;
    data['status'] = status;
    data['errors'] = errors;
    return data;
  }
}

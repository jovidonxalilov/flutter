class SendingModel {
  final String id;
  final String title;

  SendingModel({required this.title, required this.id});
  factory SendingModel.fromJson(Map<String, dynamic> json) {
    return SendingModel(title: json['title'] ?? '', id: json['id']);
  }

}

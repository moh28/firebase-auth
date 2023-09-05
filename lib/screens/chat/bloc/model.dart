class MessagesModel {
  late final String message;
  MessagesModel.fromJson(json) {
    message = json['message']??'';
  }
}

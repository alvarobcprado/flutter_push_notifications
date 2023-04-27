class AppNotification {
  const AppNotification({this.title, this.body});

  final String? title;
  final String? body;

  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      title: map['title'],
      body: map['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
    };
  }
}

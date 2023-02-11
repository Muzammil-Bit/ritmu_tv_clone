class Video {
  Video({
    required this.id,
    required this.url,
    required this.type,
    this.startTime,
    this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String url;
  String type;
  String? startTime;
  String? endTime;
  DateTime createdAt;
  DateTime updatedAt;

  static List<Video> listFromMap(List<dynamic> json) {
    return List<Video>.from(
      json.map(
        (x) => Video.fromMap(x),
      ),
    );
  }

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        id: json["id"],
        url: json["url"],
        type: json["type"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "type": type,
        "start_time": startTime,
        "end_time": endTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

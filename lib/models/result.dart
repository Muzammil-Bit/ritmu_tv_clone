class Result {
  Result({
    required this.id,
    required this.time,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  DateTime time;
  String result;
  DateTime createdAt;
  DateTime updatedAt;

  static List<Result> listFromMap(List<dynamic> json) {
    return List<Result>.from(
      json.map(
        (x) => Result.fromMap(x),
      ),
    );
  }

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        time: DateTime.parse(json["time"]),
        result: json["result"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "time": time.toIso8601String(),
        "result": result,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Media {
  final int id;
  final String media;
  final int targetTableId;
  final String targetTableName;

  Media({
    required this.id,
    required this.media,
    required this.targetTableId,
    required this.targetTableName,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json['id'] as int? ?? 0,
        media: json['media'] as String? ?? "",
        targetTableId: json['target_table_id'] as int? ?? 0,
        targetTableName: json['target_table_name'] as String? ?? "",
      );
}

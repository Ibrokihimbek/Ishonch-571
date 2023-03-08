class UpdateMediaDto {
  final String media;
  final int targetTableId;
  final String targetTableName;

  UpdateMediaDto({
    required this.media,
    required this.targetTableId,
    required this.targetTableName,
  });

  factory UpdateMediaDto.fromJson(Map<String, dynamic> json) => UpdateMediaDto(
        media: json['media'] as String? ?? "",
        targetTableId: json['target_table_id'] as int? ?? 0,
        targetTableName: json['target_table_name'] as String? ?? "",
      );
}

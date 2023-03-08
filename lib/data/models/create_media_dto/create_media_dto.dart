class CreateMediaDto {
  final String media;
  final int targetTableId;
  final String targetTableName;

  CreateMediaDto({
    required this.media,
    required this.targetTableId,
    required this.targetTableName,
  });

  factory CreateMediaDto.fromJson(Map<String, dynamic> json) => CreateMediaDto(
        media: json['media'] as String? ?? "",
        targetTableId: json['target_table_id'] as int? ?? 0,
        targetTableName: json['target_table_name'] as String? ?? "",
      );
}

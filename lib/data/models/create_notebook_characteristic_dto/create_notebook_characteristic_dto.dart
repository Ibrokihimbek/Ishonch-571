class CreateNotebookCharacteristicDto {
  final String color;
  final String memoryRom;
  final String memoryRam;
  final String videoCard;
  final String warranty;
  final String display;

  CreateNotebookCharacteristicDto({
    required this.color,
    required this.memoryRom,
    required this.memoryRam,
    required this.videoCard,
    required this.warranty,
    required this.display,
  });

  factory CreateNotebookCharacteristicDto.fromJson(Map<String, dynamic> json) =>
      CreateNotebookCharacteristicDto(
        color: json['color'] as String? ?? "",
        memoryRom: json['memory_rom'] as String? ?? "",
        memoryRam: json['memory_ram'] as String? ?? "",
        videoCard: json['videocard'] as String? ?? "",
        warranty: json['warranty'] as String? ?? "",
        display: json['display'] as String? ?? "",
      );
}

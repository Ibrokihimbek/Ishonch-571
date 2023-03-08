class Notebook {
  final int id;
  final String color;
  final String memoryRom;
  final String memoryRam;
  final String videoCard;
  final String warranty;
  final String display;

  Notebook({
    required this.id,
    required this.color,
    required this.memoryRom,
    required this.memoryRam,
    required this.videoCard,
    required this.warranty,
    required this.display,
  });

  factory Notebook.fromJson(Map<String, dynamic> json) => Notebook(
        id: json['id'] as int? ?? 0,
        color: json['color'] as String? ?? "",
        memoryRom: json['memory_rom'] as String? ?? "",
        memoryRam: json['memory_ram'] as String? ?? "",
        videoCard: json['videocard'] as String? ?? "",
        warranty: json['warranty'] as String? ?? "",
        display: json['display'] as String? ?? "",
      );
}

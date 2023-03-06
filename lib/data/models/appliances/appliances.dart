class Appliances {
  final int id;
  final String classenergopotrebleniya;
  final String warranty;
  final String volumeL;
  final String volumeOfRefrigeratorCompartmentL;
  final String freezerVolumeL;
  final String freezerLocation;
  final String heightCm;
  final String widthCm;
  final String depthCm;
  final String diagonal;
  final bool isSmart;
  final String capacity;
  final String color;
  final bool isInvertormotor;

  Appliances({
    required this.id,
    required this.classenergopotrebleniya,
    required this.warranty,
    required this.volumeL,
    required this.volumeOfRefrigeratorCompartmentL,
    required this.freezerVolumeL,
    required this.freezerLocation,
    required this.heightCm,
    required this.widthCm,
    required this.depthCm,
    required this.diagonal,
    required this.isSmart,
    required this.capacity,
    required this.color,
    required this.isInvertormotor,
  });

  factory Appliances.fromJson(Map<String, dynamic> json) => Appliances(
        id: json['id'] as int? ?? 0,
        classenergopotrebleniya:
            json['classenergopotrebleniya'] as String? ?? "",
        warranty: json['warranty'] as String? ?? "",
        volumeL: json['volume_l'] as String? ?? "",
        volumeOfRefrigeratorCompartmentL:
            json['volume_of_refrigerator_compartment_l'] as String? ?? "",
        freezerVolumeL: json['freezer_volume_l'] as String? ?? "",
        freezerLocation: json['freezer_location'] as String? ?? "",
        heightCm: json['height_cm'] as String? ?? "",
        widthCm: json['width_cm'] as String? ?? "",
        depthCm: json['depth_cm'] as String? ?? "",
        diagonal: json['diagonal'] as String? ?? "",
        isSmart: json['is_smart'] as bool? ?? false,
        capacity: json['is_smart'] as String? ?? "",
        color: json['color'] as String? ?? "",
        isInvertormotor: json['isInvertormotor'] as bool? ?? false,
      );
}

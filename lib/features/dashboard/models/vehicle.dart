import 'package:movemate/core/utils/assets.dart';

class VehicleModel {
  final String title;
  final String image;
  final String subtitle;

  VehicleModel({
    required this.title,
    required this.image,
    required this.subtitle,
  });
}

List<VehicleModel> get vehicles => [
      VehicleModel(
        title: 'Ocean freight',
        subtitle: 'International',
        image: AppAssets.oceanFreight,
      ),
      VehicleModel(
        title: 'Cargo freight',
        subtitle: 'Reliable',
        image: AppAssets.cargoFreight,
      ),
      VehicleModel(
        title: 'Air freight',
        subtitle: 'International',
        image: AppAssets.airFreight,
      ),
    ];

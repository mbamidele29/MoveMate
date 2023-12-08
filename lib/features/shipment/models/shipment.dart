import 'package:movemate/features/dashboard/models/order.dart';
import 'package:movemate/features/shipment/utils/enums.dart';

class ShipmentModel extends OrderModel {
  final num amount;
  final ShipmentStatus status;

  ShipmentModel(
      {required super.id,
      required super.to,
      required super.name,
      required super.from,
      required this.amount,
      required this.status});
}

List<ShipmentModel> get shipments {
  var data = [
    ShipmentModel(
        id: 'NEJ20089934122231',
        to: 'Morocco',
        name: 'Mackbook pro M2',
        from: 'Paris',
        amount: 1400,
        status: ShipmentStatus.completed),
    ShipmentModel(
        id: 'NEJ20089434122232',
        to: 'Paris',
        name: 'Summer linen jacket',
        from: 'Barcelona',
        amount: 200,
        status: ShipmentStatus.completed),
    ShipmentModel(
        id: 'NEJ20189434122236',
        to: 'Paris',
        name: 'Tapered-fit Jeans AW',
        from: 'Columbia',
        amount: 650,
        status: ShipmentStatus.completed),
    ShipmentModel(
        id: 'NEJ20189434182256',
        to: 'Dhaka',
        name: 'Slim fit jeans AW',
        from: 'Bogota',
        amount: 150,
        status: ShipmentStatus.completed),
    ShipmentModel(
        id: 'NEJ20189434182279',
        to: 'German',
        name: 'Office setup desk',
        from: 'France',
        amount: 1000,
        status: ShipmentStatus.completed),
    ShipmentModel(
        id: 'NES20189434122236',
        to: 'Paris',
        name: 'Tapered-fit Jeans AW',
        from: 'Columbia',
        amount: 650,
        status: ShipmentStatus.inProgress),
    ShipmentModel(
        id: 'NES20189434182256',
        to: 'Dhaka',
        name: 'Slim fit jeans AW',
        from: 'Bogota',
        amount: 150,
        status: ShipmentStatus.inProgress),
    ShipmentModel(
        id: 'NES20189434182279',
        to: 'German',
        name: 'Office setup desk',
        from: 'France',
        amount: 1000,
        status: ShipmentStatus.inProgress),
    ShipmentModel(
        id: 'NER20189434182256',
        to: 'Dhaka',
        name: 'Slim fit jeans AW',
        from: 'Bogota',
        amount: 150,
        status: ShipmentStatus.pending),
    ShipmentModel(
        id: 'NER20189434182279',
        to: 'German',
        name: 'Office setup desk',
        from: 'France',
        amount: 1000,
        status: ShipmentStatus.pending),
    ShipmentModel(
        id: 'NEL20089934122231',
        to: 'Morocco',
        name: 'Mackbook pro M2',
        from: 'Paris',
        amount: 1400,
        status: ShipmentStatus.cancelled),
    ShipmentModel(
        id: 'NEL20089434122232',
        to: 'Paris',
        name: 'Summer linen jacket',
        from: 'Barcelona',
        amount: 200,
        status: ShipmentStatus.cancelled),
  ];

  data.shuffle();
  return data;
}

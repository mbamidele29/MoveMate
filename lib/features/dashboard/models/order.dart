class OrderModel {
  final String id;
  final String to;
  final String name;
  final String from;

  OrderModel(
      {required this.id,
      required this.to,
      required this.name,
      required this.from});
}

List<OrderModel> orders = [
  OrderModel(
    id: 'NEJ20089934122231',
    to: 'Morocco',
    name: 'Mackbook pro M2',
    from: 'Paris',
  ),
  OrderModel(
    id: 'NEJ20089434122232',
    to: 'Paris',
    name: 'Summer linen jacket',
    from: 'Barcelona',
  ),
  OrderModel(
    id: 'NEJ20189434122236',
    to: 'Paris',
    name: 'Tapered-fit Jeans AW',
    from: 'Columbia',
  ),
  OrderModel(
    id: 'NEJ20189434182256',
    to: 'Dhaka',
    name: 'Slim fit jeans AW',
    from: 'Bogota',
  ),
  OrderModel(
    id: 'NEJ20189434182279',
    to: 'German',
    name: 'Office setup desk',
    from: 'France',
  ),
];

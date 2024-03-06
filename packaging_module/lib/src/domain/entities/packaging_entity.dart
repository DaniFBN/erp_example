class PackagingEntity {
  final int id;
  final int enterpriseID;
  final String name;
  final String description;
  final double price;
  final double amount;

  const PackagingEntity({
    required this.id,
    required this.enterpriseID,
    required this.name,
    required this.description,
    required this.price,
    required this.amount,
  });
}

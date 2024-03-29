class OrganizationCard {
  final String id;
  final String name;
  final String location;
  final String description;

  OrganizationCard({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
  });
}

class BusinessCard {
  final String id;
  final String name;
  final String location;
  final String selectedOrganization;
  final String description;

  BusinessCard({
    required this.id,
    required this.name,
    required this.location,
    required this.selectedOrganization,
    required this.description,
  });
}

class WarehouseCard {
  final String id;
  final String name;
  final String location;
  final String sellectedBussiness;
  final String selectedOrganization;
  
  final String description;

  WarehouseCard(
     {
    required this.id,
    required this.name,
    required this.location,
    required this.sellectedBussiness,
    required this.selectedOrganization,
    required this.description,
  });
}

class ShopsCard {
  final String id;
  final String name;
  final String location;
  final String selectedBusiness;
  final String selectedOrganization;
  final String description;

  ShopsCard({
    required this.id,
    required this.name,
    required this.location,
    required this.selectedBusiness,
    required this.selectedOrganization,
    required this.description,
  });
}

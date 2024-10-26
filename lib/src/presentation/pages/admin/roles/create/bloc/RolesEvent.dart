abstract class RolesEvent {}

class CreateRole extends RolesEvent {
  final String id;
  final String name;
  final String image;
  final String route;

  CreateRole({
    required this.id,
    required this.name,
    required this.image,
    required this.route,
  });
}

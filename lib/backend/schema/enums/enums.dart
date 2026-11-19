import 'package:collection/collection.dart';

/// Each user has a collection of roles, which decides the permissions they
/// receive on the site.
///
/// Default is 'student'.
enum EnumRole {
  /// A 'student', which is the default user.
  ///
  /// They are looking for classes and tutors.
  student,

  /// A tutor.
  ///
  /// They are looking to tutor for specific classes.
  tutor,

  /// A receptionist.
  receptionist,

  /// An admin.
  ///
  /// Has elevated permissions.
  administrator,
}

/// The status of the tutor; i.e, active, on-leave, former.
enum EnumStatus {
  active,
  on_leave,
  former,
}

/// A list of elevated permissions that a staff member can use.
enum EnumPermissions {
  None,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (EnumRole):
      return EnumRole.values.deserialize(value) as T?;
    case (EnumStatus):
      return EnumStatus.values.deserialize(value) as T?;
    case (EnumPermissions):
      return EnumPermissions.values.deserialize(value) as T?;
    default:
      return null;
  }
}

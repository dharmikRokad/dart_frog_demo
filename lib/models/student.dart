import 'package:equatable/equatable.dart';
import 'package:frog_demo/extensions/date_time_extension.dart';
import 'package:frog_demo/extensions/string_ext.dart';
import 'package:json_annotation/json_annotation.dart';
part 'student.g.dart';

@JsonSerializable()

/// User model
class Student extends Equatable {
  /// Default constructor
  const Student({
    this.id = '',
    this.name = '',
    this.age = 0,
    this.dob,
  });

  /// fromJson constructor
  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  /// Unique identifier for each user
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String id;

  /// Name of user
  @JsonKey(name: 'name', required: false)
  final String name;

  /// Age of user
  @JsonKey(name: 'age')
  final int age;

  /// DOB of user
  @JsonKey(name: 'dob', fromJson: toDateTime, toJson: dateToString)
  final DateTime? dob;

  /// to Json
  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  List<Object?> get props => [id];

  /// copy with method
  Student copyWith({
    String? id,
    String? name,
    int? age,
    DateTime? dob,
  }) =>
      Student(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        dob: dob ?? this.dob,
      );
}

///
DateTime? toDateTime(String date) => date.toDateTime;

///
String dateToString(DateTime? date) => date?.ddMMyyyy ?? '';

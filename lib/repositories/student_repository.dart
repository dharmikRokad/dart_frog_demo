import 'package:frog_demo/models/student.dart';
import 'package:uuid/uuid.dart';

/// all users
final List<Student> students = [];

/// repo class for user to preform CRUD
class StudentRepository {
  /// CREATE  new user
  Future<Student> createStudent({
    required String name,
    required int age,
    DateTime? dob,
  }) async {
    final student = Student(
      id: const Uuid().v1(),
      name: name,
      age: age,
      dob: dob,
    );
    students.add(student);
    return student;
  }

  /// READ exisiting user
  Future<Student> readStudent({required String id}) async {
    return students.firstWhere((element) => element.id == id);
  }

  /// READ all users
  Future<List<Student>> getAllstudents() async {
    return students;
  }

  /// UPDATE existing user
  Future<Student> updateStudent({
    required String id,
    String? name,
    int? age,
    DateTime? dob,
  }) async {
    final student = await readStudent(id: id);
    students[students.indexOf(student)] = student.copyWith(
      name: name ?? student.name,
      age: age ?? student.age,
      dob: dob ?? student.dob,
    );
    return readStudent(id: id);
  }

  /// DELETE existing user
  Future<void> deleteStudent({
    required String id,
  }) async {
    return students.removeWhere((element) => element.id == id);
  }
}

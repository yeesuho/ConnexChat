// class Employee {
//   String profile;
//   String name;
//
//   Employee(
//       this.profile,
//       this.name,
//   );
//
//   factory Employee.fromJson(json) {
//     return Employee(
//       json['사원 프로필'],
//       json['사원 이름'],
//     );
//   }
// }

class Employees {
  String profile;
  String name;

  Employees(
      this.profile,
      this.name,
  );

  factory Employees.fromJson(json) {
    return Employees(
      json['사원 프로필'],
      json['사원 이름'],
    );
  }
}


class Employee {
  int id;
  String name;
  String department;
  String position;
  String profileImage;

  Employee(
      this.id,
      this.name,
      this.department,
      this.position,
      this.profileImage
      );

  factory Employee.fromJson(json) {
    return Employee(
      json['id'],
      json['name'],
      json['department'],
      json['position'],
      json['profileImage'],
    );
  }
}
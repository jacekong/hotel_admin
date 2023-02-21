import 'dart:convert';

class TopModel {
  final String FirstName;
  final String LastName;
  final String Email;
  final String PhoneNo;
  final String Gender;
  final int guest_id;
  final int StayPeriod;
  TopModel({
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.PhoneNo,
    required this.Gender,
    required this.guest_id,
    required this.StayPeriod,
  });

  TopModel copyWith({
    String? FirstName,
    String? LastName,
    String? Email,
    String? PhoneNo,
    String? Gender,
    int? guest_id,
    int? StayPeriod,
  }) {
    return TopModel(
      FirstName: FirstName ?? this.FirstName,
      LastName: LastName ?? this.LastName,
      Email: Email ?? this.Email,
      PhoneNo: PhoneNo ?? this.PhoneNo,
      Gender: Gender ?? this.Gender,
      guest_id: guest_id ?? this.guest_id,
      StayPeriod: StayPeriod ?? this.StayPeriod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FirstName': FirstName,
      'LastName': LastName,
      'Email': Email,
      'PhoneNo': PhoneNo,
      'Gender': Gender,
      'guest_id': guest_id,
      'StayPeriod': StayPeriod,
    };
  }

  factory TopModel.fromMap(Map<String, dynamic> map) {
    return TopModel(
      FirstName: map['FirstName'] as String,
      LastName: map['LastName'] as String,
      Email: map['Email'] as String,
      PhoneNo: map['PhoneNo'] as String,
      Gender: map['Gender'] as String,
      guest_id: map['guest_id'].toInt() as int,
      StayPeriod: map['StayPeriod'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopModel.fromJson(String source) => TopModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TopModel(FirstName: $FirstName, LastName: $LastName, Email: $Email, PhoneNo: $PhoneNo, Gender: $Gender, guest_id: $guest_id, StayPeriod: $StayPeriod)';
  }

  @override
  bool operator ==(covariant TopModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.FirstName == FirstName &&
      other.LastName == LastName &&
      other.Email == Email &&
      other.PhoneNo == PhoneNo &&
      other.Gender == Gender &&
      other.guest_id == guest_id &&
      other.StayPeriod == StayPeriod;
  }

  @override
  int get hashCode {
    return FirstName.hashCode ^
      LastName.hashCode ^
      Email.hashCode ^
      PhoneNo.hashCode ^
      Gender.hashCode ^
      guest_id.hashCode ^
      StayPeriod.hashCode;
  }
}
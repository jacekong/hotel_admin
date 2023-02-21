import 'dart:convert';

class AssignedModel {
  final int ReservationID;
  final String FirstName;
  final String LastName;
  final String PassportNo;
  final String CitizenNo;
  final String GuestTitle;
  final int room_no;
  final String ArrivalDate;
  final String departure;
  final int StayPeriod;
  final String room_assigned;
  final String SpecialRequest;
  final String Email;
  final String PhoneNo;
  AssignedModel({
    required this.ReservationID,
    required this.FirstName,
    required this.LastName,
    required this.PassportNo,
    required this.CitizenNo,
    required this.GuestTitle,
    required this.room_no,
    required this.ArrivalDate,
    required this.departure,
    required this.StayPeriod,
    required this.room_assigned,
    required this.SpecialRequest,
    required this.Email,
    required this.PhoneNo,
  });

  AssignedModel copyWith({
    int? ReservationID,
    String? FirstName,
    String? LastName,
    String? PassportNo,
    String? CitizenNo,
    String? GuestTitle,
    int? room_no,
    String? ArrivalDate,
    String? departure,
    int? StayPeriod,
    String? room_assigned,
    String? SpecialRequest,
    String? Email,
    String? PhoneNo,
  }) {
    return AssignedModel(
      ReservationID: ReservationID ?? this.ReservationID,
      FirstName: FirstName ?? this.FirstName,
      LastName: LastName ?? this.LastName,
      PassportNo: PassportNo ?? this.PassportNo,
      CitizenNo: CitizenNo ?? this.CitizenNo,
      GuestTitle: GuestTitle ?? this.GuestTitle,
      room_no: room_no ?? this.room_no,
      ArrivalDate: ArrivalDate ?? this.ArrivalDate,
      departure: departure ?? this.departure,
      StayPeriod: StayPeriod ?? this.StayPeriod,
      room_assigned: room_assigned ?? this.room_assigned,
      SpecialRequest: SpecialRequest ?? this.SpecialRequest,
      Email: Email ?? this.Email,
      PhoneNo: PhoneNo ?? this.PhoneNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ReservationID': ReservationID,
      'FirstName': FirstName,
      'LastName': LastName,
      'PassportNo': PassportNo,
      'CitizenNo': CitizenNo,
      'GuestTitle': GuestTitle,
      'room_no': room_no,
      'ArrivalDate': ArrivalDate,
      'departure': departure,
      'StayPeriod': StayPeriod,
      'room_assigned': room_assigned,
      'SpecialRequest': SpecialRequest,
      'Email': Email,
      'PhoneNo': PhoneNo,
    };
  }

  factory AssignedModel.fromMap(Map<String, dynamic> map) {
    return AssignedModel(
      ReservationID: map['ReservationID'].toInt() as int,
      FirstName: map['FirstName'] as String,
      LastName: map['LastName'] as String,
      PassportNo: map['PassportNo'] as String,
      CitizenNo: map['CitizenNo'] as String,
      GuestTitle: map['GuestTitle'] as String,
      room_no: map['room_no'].toInt() as int,
      ArrivalDate: map['ArrivalDate'] as String,
      departure: map['departure'] as String,
      StayPeriod: map['StayPeriod'].toInt() as int,
      room_assigned: map['room_assigned'] as String,
      SpecialRequest: map['SpecialRequest'] as String,
      Email: map['Email'] as String,
      PhoneNo: map['PhoneNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignedModel.fromJson(String source) => AssignedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AssignedModel(ReservationID: $ReservationID, FirstName: $FirstName, LastName: $LastName, PassportNo: $PassportNo, CitizenNo: $CitizenNo, GuestTitle: $GuestTitle, room_no: $room_no, ArrivalDate: $ArrivalDate, departure: $departure, StayPeriod: $StayPeriod, room_assigned: $room_assigned, SpecialRequest: $SpecialRequest, Email: $Email, PhoneNo: $PhoneNo)';
  }

  @override
  bool operator ==(covariant AssignedModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.ReservationID == ReservationID &&
      other.FirstName == FirstName &&
      other.LastName == LastName &&
      other.PassportNo == PassportNo &&
      other.CitizenNo == CitizenNo &&
      other.GuestTitle == GuestTitle &&
      other.room_no == room_no &&
      other.ArrivalDate == ArrivalDate &&
      other.departure == departure &&
      other.StayPeriod == StayPeriod &&
      other.room_assigned == room_assigned &&
      other.SpecialRequest == SpecialRequest &&
      other.Email == Email &&
      other.PhoneNo == PhoneNo;
  }

  @override
  int get hashCode {
    return ReservationID.hashCode ^
      FirstName.hashCode ^
      LastName.hashCode ^
      PassportNo.hashCode ^
      CitizenNo.hashCode ^
      GuestTitle.hashCode ^
      room_no.hashCode ^
      ArrivalDate.hashCode ^
      departure.hashCode ^
      StayPeriod.hashCode ^
      room_assigned.hashCode ^
      SpecialRequest.hashCode ^
      Email.hashCode ^
      PhoneNo.hashCode;
  }
}
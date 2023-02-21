import 'dart:convert';

class ReservationModel {
  final int ReservationID;
  final String ReservationDate;
  final String ArrivalDate;
  final String DepartureDate;
  final String ArrivalTime;
  final String DepartureTime;
  final int NoAdults;
  final int NoChildren;
  final String SpecialRequest;
  final String RoomType;
  final int guest_id;
  final int StayPeriod;
  final String room_assigned;
  ReservationModel({
    required this.ReservationID,
    required this.ReservationDate,
    required this.ArrivalDate,
    required this.DepartureDate,
    required this.ArrivalTime,
    required this.DepartureTime,
    required this.NoAdults,
    required this.NoChildren,
    required this.SpecialRequest,
    required this.RoomType,
    required this.guest_id,
    required this.StayPeriod,
    required this.room_assigned,
  });

  ReservationModel copyWith({
    int? ReservationID,
    String? ReservationDate,
    String? ArrivalDate,
    String? DepartureDate,
    String? ArrivalTime,
    String? DepartureTime,
    int? NoAdults,
    int? NoChildren,
    String? SpecialRequest,
    String? RoomType,
    int? guest_id,
    int? StayPeriod,
    String? room_assigned,
  }) {
    return ReservationModel(
      ReservationID: ReservationID ?? this.ReservationID,
      ReservationDate: ReservationDate ?? this.ReservationDate,
      ArrivalDate: ArrivalDate ?? this.ArrivalDate,
      DepartureDate: DepartureDate ?? this.DepartureDate,
      ArrivalTime: ArrivalTime ?? this.ArrivalTime,
      DepartureTime: DepartureTime ?? this.DepartureTime,
      NoAdults: NoAdults ?? this.NoAdults,
      NoChildren: NoChildren ?? this.NoChildren,
      SpecialRequest: SpecialRequest ?? this.SpecialRequest,
      RoomType: RoomType ?? this.RoomType,
      guest_id: guest_id ?? this.guest_id,
      StayPeriod: StayPeriod ?? this.StayPeriod,
      room_assigned: room_assigned ?? this.room_assigned,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ReservationID': ReservationID,
      'ReservationDate': ReservationDate,
      'ArrivalDate': ArrivalDate,
      'DepartureDate': DepartureDate,
      'ArrivalTime': ArrivalTime,
      'DepartureTime': DepartureTime,
      'NoAdults': NoAdults,
      'NoChildren': NoChildren,
      'SpecialRequest': SpecialRequest,
      'RoomType': RoomType,
      'guest_id': guest_id,
      'StayPeriod': StayPeriod,
      'room_assigned': room_assigned,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      ReservationID: map['ReservationID'].toInt() as int,
      ReservationDate: map['ReservationDate'] as String,
      ArrivalDate: map['ArrivalDate'] as String,
      DepartureDate: map['DepartureDate'] as String,
      ArrivalTime: map['ArrivalTime'] as String,
      DepartureTime: map['DepartureTime'] as String,
      NoAdults: map['NoAdults'].toInt() as int,
      NoChildren: map['NoChildren'].toInt() as int,
      SpecialRequest: map['SpecialRequest'] as String,
      RoomType: map['RoomType'] as String,
      guest_id: map['guest_id'].toInt() as int,
      StayPeriod: map['StayPeriod'].toInt() as int,
      room_assigned: map['room_assigned'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) => ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationModel(ReservationID: $ReservationID, ReservationDate: $ReservationDate, ArrivalDate: $ArrivalDate, DepartureDate: $DepartureDate, ArrivalTime: $ArrivalTime, DepartureTime: $DepartureTime, NoAdults: $NoAdults, NoChildren: $NoChildren, SpecialRequest: $SpecialRequest, RoomType: $RoomType, guest_id: $guest_id, StayPeriod: $StayPeriod, room_assigned: $room_assigned)';
  }

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.ReservationID == ReservationID &&
      other.ReservationDate == ReservationDate &&
      other.ArrivalDate == ArrivalDate &&
      other.DepartureDate == DepartureDate &&
      other.ArrivalTime == ArrivalTime &&
      other.DepartureTime == DepartureTime &&
      other.NoAdults == NoAdults &&
      other.NoChildren == NoChildren &&
      other.SpecialRequest == SpecialRequest &&
      other.RoomType == RoomType &&
      other.guest_id == guest_id &&
      other.StayPeriod == StayPeriod &&
      other.room_assigned == room_assigned;
  }

  @override
  int get hashCode {
    return ReservationID.hashCode ^
      ReservationDate.hashCode ^
      ArrivalDate.hashCode ^
      DepartureDate.hashCode ^
      ArrivalTime.hashCode ^
      DepartureTime.hashCode ^
      NoAdults.hashCode ^
      NoChildren.hashCode ^
      SpecialRequest.hashCode ^
      RoomType.hashCode ^
      guest_id.hashCode ^
      StayPeriod.hashCode ^
      room_assigned.hashCode;
  }
}
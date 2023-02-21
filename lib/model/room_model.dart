import 'dart:convert';

class RoomModel {
  final int RoomNo;
  final String RoomType;
  final String RoomAvailable;
  final int RoomRate;
  final String RoomStatus;
  RoomModel({
    required this.RoomNo,
    required this.RoomType,
    required this.RoomAvailable,
    required this.RoomRate,
    required this.RoomStatus,
  });

  RoomModel copyWith({
    int? RoomNo,
    String? RoomType,
    String? RoomAvailable,
    int? RoomRate,
    String? RoomStatus,
  }) {
    return RoomModel(
      RoomNo: RoomNo ?? this.RoomNo,
      RoomType: RoomType ?? this.RoomType,
      RoomAvailable: RoomAvailable ?? this.RoomAvailable,
      RoomRate: RoomRate ?? this.RoomRate,
      RoomStatus: RoomStatus ?? this.RoomStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'RoomNo': RoomNo,
      'RoomType': RoomType,
      'RoomAvailable': RoomAvailable,
      'RoomRate': RoomRate,
      'RoomStatus': RoomStatus,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      RoomNo: map['RoomNo'].toInt() as int,
      RoomType: map['RoomType'] as String,
      RoomAvailable: map['RoomAvailable'] as String,
      RoomRate: map['RoomRate'].toInt() as int,
      RoomStatus: map['RoomStatus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) => RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomModel(RoomNo: $RoomNo, RoomType: $RoomType, RoomAvailable: $RoomAvailable, RoomRate: $RoomRate, RoomStatus: $RoomStatus)';
  }

  @override
  bool operator ==(covariant RoomModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.RoomNo == RoomNo &&
      other.RoomType == RoomType &&
      other.RoomAvailable == RoomAvailable &&
      other.RoomRate == RoomRate &&
      other.RoomStatus == RoomStatus;
  }

  @override
  int get hashCode {
    return RoomNo.hashCode ^
      RoomType.hashCode ^
      RoomAvailable.hashCode ^
      RoomRate.hashCode ^
      RoomStatus.hashCode;
  }
}
import 'dart:convert';

class PaymentModel {
  final int ReceiptNo;
  final String PaymentType;
  final int TotalAmount;
  final String Vat;
  final double GrandTotal;
  final String BillDate;
  final int ReservationID;
  PaymentModel({
    required this.ReceiptNo,
    required this.PaymentType,
    required this.TotalAmount,
    required this.Vat,
    required this.GrandTotal,
    required this.BillDate,
    required this.ReservationID,
  });

  PaymentModel copyWith({
    int? ReceiptNo,
    String? PaymentType,
    int? TotalAmount,
    String? Vat,
    double? GrandTotal,
    String? BillDate,
    int? ReservationID,
  }) {
    return PaymentModel(
      ReceiptNo: ReceiptNo ?? this.ReceiptNo,
      PaymentType: PaymentType ?? this.PaymentType,
      TotalAmount: TotalAmount ?? this.TotalAmount,
      Vat: Vat ?? this.Vat,
      GrandTotal: GrandTotal ?? this.GrandTotal,
      BillDate: BillDate ?? this.BillDate,
      ReservationID: ReservationID ?? this.ReservationID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ReceiptNo': ReceiptNo,
      'PaymentType': PaymentType,
      'TotalAmount': TotalAmount,
      'Vat': Vat,
      'GrandTotal': GrandTotal,
      'BillDate': BillDate,
      'ReservationID': ReservationID,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      ReceiptNo: map['ReceiptNo'].toInt() as int,
      PaymentType: map['PaymentType'] as String,
      TotalAmount: map['TotalAmount'].toInt() as int,
      Vat: map['Vat'] as String,
      GrandTotal: map['GrandTotal'].toDouble() as double,
      BillDate: map['BillDate'] as String,
      ReservationID: map['ReservationID'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) => PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(ReceiptNo: $ReceiptNo, PaymentType: $PaymentType, TotalAmount: $TotalAmount, Vat: $Vat, GrandTotal: $GrandTotal, BillDate: $BillDate, ReservationID: $ReservationID)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.ReceiptNo == ReceiptNo &&
      other.PaymentType == PaymentType &&
      other.TotalAmount == TotalAmount &&
      other.Vat == Vat &&
      other.GrandTotal == GrandTotal &&
      other.BillDate == BillDate &&
      other.ReservationID == ReservationID;
  }

  @override
  int get hashCode {
    return ReceiptNo.hashCode ^
      PaymentType.hashCode ^
      TotalAmount.hashCode ^
      Vat.hashCode ^
      GrandTotal.hashCode ^
      BillDate.hashCode ^
      ReservationID.hashCode;
  }
}
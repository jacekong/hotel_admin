import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotel_admin/model/assinged.dart';
import 'package:hotel_admin/model/payment_model.dart';
import 'package:hotel_admin/model/reservation_model.dart';
import 'package:hotel_admin/model/room_model.dart';
import 'package:hotel_admin/model/top.dart';
import 'package:http/http.dart' as http;

class Store extends ChangeNotifier {
  
  List<ReservationModel> _reservation = [];
  List<ReservationModel> get reservation => _reservation;
  void setModel(List<ReservationModel> reservation) {
    _reservation = reservation;
    //notifyListeners();
  }

  List<PaymentModel> _rooms = [];
  List<PaymentModel> get rooms => _rooms;
  void setRoom(List<PaymentModel> rooms) {
    _rooms = rooms;
  }

  List<TopModel> _top = [];
  List<TopModel> get top => _top;
  void setTop(List<TopModel> top) {
    _top = top;
  }

  List<RoomModel> _roomno = [];
  List<RoomModel> get roomno => _roomno;
  void setRoomNo(List<RoomModel> roomno) {
    _roomno = roomno;
  }

  List<AssignedModel> _assigned = [];
  List<AssignedModel> get assigned => _assigned;
  void setAssign(List<AssignedModel> assigned) {
    _assigned = assigned;
  }

  Future<String> get(url) async {
    //1. convert param dict to json

    //2. send post request
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    }
    //no success
    else {
      //print(res.statusCode);
      // ignore: null_argument_to_non_null_type
      return Future<String>.value(null);
    }
  } //ef

  Future<List<ReservationModel>> fetchData({bool refresh = false}) async {
    //1. either refresh or empty list
    if (_reservation.isEmpty || refresh == true) {
      _reservation = [];
      //2. define url
      var url = "http://192.168.80.168:1880/getreservation";
      //3. get raw data/json text;
      var res = await get(url);
      //4. convert json text to list of dictionary
      var list1 = json.decode(res.toString()) as List;
      //5. convert map of dictionary to list of object
      var reservation = list1.map((e) => ReservationModel.fromMap(e)).toList();
      //notifyListeners();
      //print(reservation);
      //important
      setModel(reservation);
      return reservation;
    } else {
      return _reservation;
    }
  } //ef

  Future<List<PaymentModel>> getPayment({bool refresh = false}) async {
    //1. either refresh or empty list
    if (rooms.isEmpty || refresh == true) {
      _rooms = [];
      //2. define url
      var url = "http://192.168.80.168:1880/getpayment";
      //3. get raw data/json text;
      var res = await get(url);
      //4. convert json text to list of dictionary
      var list1 = json.decode(res.toString()) as List;
      //5. convert map of dictionary to list of object
      var rooms = list1.map((e) => PaymentModel.fromMap(e)).toList();
      //notifyListeners();
      setRoom(rooms);
      return rooms;
    } else {
      return _rooms;
    }
  } //ef

  Future<List<TopModel>> getTop({bool refresh = false}) async {
    //1. either refresh or empty list
    if (top.isEmpty || refresh == true) {
      _top = [];
      //2. define url
      var url = "http://192.168.80.168:1880/gettop10";
      //3. get raw data/json text;
      var res = await get(url);
      //4. convert json text to list of dictionary
      var list1 = json.decode(res.toString()) as List;
      //5. convert map of dictionary to list of object
      var top = list1.map((e) => TopModel.fromMap(e)).toList();
      //notifyListeners();
      setTop(top);
      return top;
    } else {
      return _top;
    }
  } //ef

  Future<List<RoomModel>> getRoomNo({bool refresh = false}) async {
    //1. either refresh or empty list
    if (roomno.isEmpty || refresh == true) {
      _roomno = [];
      //2. define url
      var url = "http://192.168.80.168:1880/getroomno";
      //3. get raw data/json text;
      var res = await get(url);
      //4. convert json text to list of dictionary
      var list1 = json.decode(res.toString()) as List;
      //5. convert map of dictionary to list of object
      var roomno = list1.map((e) => RoomModel.fromMap(e)).toList();
      //notifyListeners();
      setRoomNo(roomno);
      return roomno;
    } else {
      return _roomno;
    }
  } //ef

  Future<List<AssignedModel>> getAssigned({bool refresh = false}) async {
    //1. either refresh or empty list
    if (assigned.isEmpty || refresh == true) {
      _assigned = [];
      //2. define url
      var url = "http://192.168.80.168:1880/getassigned";
      //3. get raw data/json text;
      var res = await get(url);
      //4. convert json text to list of dictionary
      var list1 = json.decode(res.toString()) as List;
      //5. convert map of dictionary to list of object
      var assigned = list1.map((e) => AssignedModel.fromMap(e)).toList();
      //notifyListeners();
      setAssign(assigned);
      return assigned;
    } else {
      return _assigned;
    }
  } //ef

  // send month year to db
  Future<void> sendSaleReportMonth(year, month) async {
    //1. define url
    var url = "http://192.168.80.168:1880/date";

    //2. convert list of objects to list of dictionary
    var data1 = {
      "year": year,
      "month": month,
    };

    await http.post(
      Uri.parse(url),
      headers: {'Content-type': 'application/json'},
      body: json.encode(data1),
    );
    //print(response.body);
  } //ef

  Future<void> sendTop10Month(year, month) async {
    //1. define url
    var url = "http://192.168.80.168:1880/datetop";

    //2. convert list of objects to list of dictionary
    var data1 = {
      "year": year,
      "month": month,
    };

    await http.post(
      Uri.parse(url),
      headers: {'Content-type': 'application/json'},
      body: json.encode(data1),
    );
    //print(response.body);
  } //ef

  //get total sales for sales report
  double getTotalPrice() {
    double total = 0;
    for (PaymentModel f in _rooms) {
      total += f.GrandTotal;
    }
    return total;
  } //ef

}

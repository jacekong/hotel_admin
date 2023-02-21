import 'package:flutter/material.dart';
import 'package:hotel_admin/model/payment_model.dart';
import 'package:hotel_admin/utils/central.dart';
import 'package:hotel_admin/utils/text_style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SaleReport extends StatefulWidget {
  const SaleReport({super.key});

  @override
  State<SaleReport> createState() => _SaleReportState();
}

class _SaleReportState extends State<SaleReport> {
  late Store agent;

  DateTime _selected = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _selected = value!;
        agent.sendSaleReportMonth(_selected.year, _selected.month);
        agent.getPayment();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    agent = Provider.of<Store>(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 115,bottom: 3),
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    _showDatePicker();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "pick year/month",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "XinDu Holiday Hotel",
            style: TextStyleF.bold,
          ),
          Text(
            "Sales Report",
            style: TextStyleF.bold,
          ),
          Text("Monthly Ending: ${_selected.toString().substring(0, 10)}",
              style: TextStyleF.bold),
          const SizedBox(
            width: 7,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "#",
                    style: TextStyleF.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Payment Type", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Rate", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("VAT", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Grand Total", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Date", style: TextStyleF.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<PaymentModel>>(
              future: agent.getPayment(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  //return progress
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  //return widget
                  return agent.rooms.isEmpty
                      ? const Center(
                          child: Text(
                          "No data for this month",
                          style: TextStyle(fontSize: 20),
                        ))
                      : ListView.builder(
                          itemCount: agent.rooms.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 7, right: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          agent.rooms[index].ReceiptNo
                                              .toString(),
                                          style: TextStyleF.id,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            agent.rooms[index].PaymentType,
                                            style: TextStyleF.id),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            agent.rooms[index].TotalAmount
                                                .toString(),
                                            style: TextStyleF.id),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(agent.rooms[index].Vat,
                                            style: TextStyleF.id),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            agent.rooms[index].GrandTotal
                                                .toString(),
                                            style: TextStyleF.id),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            agent.rooms[index].BillDate
                                                .substring(0, 10),
                                            style: TextStyleF.id),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Total Sales------------------------------------------------------------------------------",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "¥${agent.getTotalPrice().toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  } //ef

} // ec

import 'package:flutter/material.dart';
import 'package:hotel_admin/model/assinged.dart';
import 'package:hotel_admin/utils/central.dart';
import 'package:hotel_admin/utils/text_style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Assign extends StatelessWidget {
  Assign({super.key});

  late Store agent;

  @override
  Widget build(BuildContext context) {
    agent = Provider.of<Store>(context);

    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26, right: 26, bottom: 7),
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
                child: Text("Room No", style: TextStyleF.bold),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Guest Title",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "First Name",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Last Name",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Passport No",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Citizen No",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Phone",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Email",
                  style: TextStyleF.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text("Arrive", style: TextStyleF.bold),
              ),
              Expanded(
                flex: 1,
                child: Text("Departure", style: TextStyleF.bold),
              ),
              Expanded(
                flex: 1,
                child: Text("Special Request", style: TextStyleF.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: FutureBuilder<List<AssignedModel>>(
            future: agent.getAssigned(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //return progress
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                //return widget
                return agent.assigned.isEmpty
                    ? const Center(
                        child: Text("Room has not assigned yet",
                            style: TextStyle(fontSize: 20)))
                    : ListView.builder(
                        itemCount: agent.assigned.length,
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
                                        agent.assigned[index].ReservationID
                                            .toString(),
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].room_no
                                            .toString(),
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].GuestTitle,
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].FirstName,
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].LastName,
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].PassportNo,
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].CitizenNo,
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].PhoneNo,
                                        
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:3),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              right: BorderSide(width: 2,color: Colors.green)
                                            )
                                          ),
                                          child: Text(
                                            agent.assigned[index].Email,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: Text(
                                          agent.assigned[index].ArrivalDate,
                                          style: TextStyleF.id,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].departure
                                            .substring(0, 10),
                                        style: TextStyleF.id,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        agent.assigned[index].SpecialRequest,
                                        style: TextStyleF.id,
                                      ),
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
      ],
    ));
  }
}

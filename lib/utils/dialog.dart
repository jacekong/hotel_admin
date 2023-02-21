import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dialogbox extends StatelessWidget {


  VoidCallback onPost;


  Dialogbox(
      {Key? key,

      required this.onPost,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              // make title
              const Text(
                "Room has been assigned!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30,),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // post
                  MaterialButton(
                    onPressed: () {
                      
                      onPost();
                      
                    },
                    child: Text("Post", style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                  ),                
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
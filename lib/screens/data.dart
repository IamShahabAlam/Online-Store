import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Chat extends StatelessWidget {
  @override

  final Map data;
  Chat ({this.data});

  Widget build(BuildContext context) {
    return Container(
        child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: ListTile(

          leading:  CircleAvatar(

            radius: 28,
            backgroundImage: NetworkImage(data["dp"]),
          ),
          title:  Text(data["contact"], style: TextStyle(color: Colors.white, fontSize: 18 ,fontWeight: FontWeight.w500),),
          subtitle: Text(data["msg"], style: TextStyle(color: Colors.white54)),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom:12.0),
            child: Text(data["time"], style: TextStyle(color: Colors.white54, fontSize: 11)),
          ),
        ),
      ) ,


    );
  }
}
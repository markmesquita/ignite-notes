import 'package:flutter/material.dart';
import 'package:notes/common/app_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["First Item"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final description =
                  await Navigator.pushNamed(context, "/create-note");
              if (description != null) notes.add(description as String);
              setState(() {});
            },
          )
        ],
      ),
      body: notes.length == 0
          ? Center(
              child: Text("No notes storaged"),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < notes.length; i++)
                    AppCard(notes: notes, index: i),

                  // Card(
                  //   child: ListTile(
                  //     title: Text(notes[i]),
                  //     onTap: () async {
                  //       final response = await Navigator.pushNamed(
                  //           context, "/create-note",
                  //           arguments: notes[i]);
                  //       if (response != null) {
                  //         var description = response as String;
                  //         if (response.isEmpty) {
                  //           notes.removeAt(i);
                  //         } else {
                  //           notes[i] = description;
                  //         }
                  //         setState(() {});
                  //       }
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final description =
      //         await Navigator.pushNamed(context, "/create-note");
      //     if (description != null) notes.add(description as String);
      //     setState(() {});
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

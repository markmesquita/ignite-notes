import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final List notes;
  final int index;

  AppCard({
    Key? key,
    required this.notes,
    required this.index,
  }) : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.notes[widget.index]),
        onTap: () async {
          final response = await Navigator.pushNamed(context, "/create-note",
              arguments: widget.notes[widget.index]);
          if (response != null) {
            var description = response as String;

            if (response.isEmpty) {
              widget.notes.removeAt(widget.index);
            } else {
              widget.notes[widget.index] = description;
            }
            print(widget.notes);
            setState(() {});
          }
        },
      ),
    );
  }
}

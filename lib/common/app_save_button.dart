import 'package:flutter/material.dart';

class AppSaveButton extends StatelessWidget {
  final String description;

  const AppSaveButton({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, description);
            },
            child: Text("Salvar"),
          ),
        ),
      ],
    );
  }
}

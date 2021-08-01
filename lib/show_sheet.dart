import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowSheet extends StatefulWidget {
  final Function(String arbic, String english) addItem;
  const ShowSheet(this.addItem, {Key? key}) : super(key: key);

  @override
  _ShowSheetState createState() => _ShowSheetState();
}

class _ShowSheetState extends State<ShowSheet> {
  var arbictranstlate = TextEditingController();
  var englishtranstlate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            TextField(
              controller: arbictranstlate,
              decoration: InputDecoration(labelText: 'Arbic'),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: englishtranstlate,
                decoration: InputDecoration(labelText: 'English'),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.addItem(arbictranstlate.text, englishtranstlate.text);
                arbictranstlate.value = TextEditingValue.empty;
                englishtranstlate.clear();
              },
              child: Text('Add Item'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}

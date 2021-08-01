import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LangWidget extends StatelessWidget {
  final String id, arabic, english;
  final Function removeItem;
  const LangWidget(this.arabic, this.english, this.id, this.removeItem,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Text('$english'),
          subtitle: Text('$arabic'),
          trailing: IconButton(
              onPressed: () {
                removeItem(id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}

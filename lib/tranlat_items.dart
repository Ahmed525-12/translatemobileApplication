import 'package:flutter/material.dart';
import './translat_languages.dart';
import './lang_item.dart';
import 'show_sheet.dart';

class TranslationItems extends StatefulWidget {
  const TranslationItems({Key? key}) : super(key: key);

  @override
  _TranslationItemsState createState() => _TranslationItemsState();
}

class _TranslationItemsState extends State<TranslationItems> {
  final List<Langauge> _listlang = [
    Langauge(arbic: 'arbic', english: "english", id: "1")
  ];
  void _showSheet() {
    showModalBottomSheet(context: context, builder: (_) => ShowSheet(addItem));
  }

  void removeItem(String id) {
    setState(() {
      _listlang.removeWhere((item) => item.id == id);
    });
  }

  void addItem(String arbic, String english) {
    setState(() {
      _listlang.add(Langauge(
          arbic: arbic, english: english, id: DateTime.now().toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Translation')),
      ),
      body: _listlang == 0
          ? Center(
              child: Text('Write Translating Words'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                ),
                itemCount: _listlang.length,
                itemBuilder: (_, index) => LangWidget(
                  _listlang[index].arbic,
                  _listlang[index].english,
                  _listlang[index].id,
                  removeItem,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSheet,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

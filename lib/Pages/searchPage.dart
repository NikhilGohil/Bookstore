import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookstore/Pages/booksSearchViewComp.dart';
import 'package:bookstore/Global/Common/appBarComp.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController _searchController = TextEditingController();
  List<String> suggestions = [];
  OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.grey, width: 1));
  @override
  void initState() {
    getSuggestions();
    super.initState();
  }

  void getSuggestions() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    suggestions = (await _sp.getStringList('suggestions'))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Appbarcomp(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 0))
                ]),
                child: TextField(
                  controller: _searchController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      hintText: 'Search...',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            SharedPreferences _sp =
                                await SharedPreferences.getInstance();
                            if (suggestions.length >= 4) {
                              suggestions.removeLast();
                            }
                            suggestions.insert(0, _searchController.text);
                            await _sp.setStringList('suggestions', suggestions);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bookssearchviewcomp(
                                        result: _searchController.text)));
                          },
                          icon: Icon(Icons.search))),
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromARGB(145, 158, 158, 158),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ],
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  splashColor: brown.withOpacity(0.5),
                  tileColor: Colors.white,
                  onLongPress: () async {
                    SharedPreferences _sp =
                        await SharedPreferences.getInstance();
                    suggestions.removeAt(index);
                    await _sp.setStringList('suggestions', suggestions);
                    setState(() {});
                  },
                  onTap: () {
                    _searchController.value =
                        TextEditingValue(text: suggestions[index]);
                  },
                  title: Text(suggestions[index]),
                  trailing: Icon(Icons.arrow_outward),
                ),
              ),
              itemCount: suggestions?.length,
            )
          ],
        ));
  }
}

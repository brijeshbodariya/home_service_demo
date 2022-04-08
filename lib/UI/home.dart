import 'package:flutter/material.dart';
import 'package:home_service_demo/UI/cards.dart';
import 'package:home_service_demo/UI/home_grid.dart';
import 'package:home_service_demo/provider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _work = Provider.of<Update>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(12.0),
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: TextField(
                  autofocus: false,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search for a service',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Container(height: 4),
          Container(
            margin: const EdgeInsets.all(4.0),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _work.getListImages().length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      _work.getListImages()[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(height: 8),
          const SelectionCategoryGrid(),
          Container(height: 8),
          const ServiceCards(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home_service_demo/provider/provider.dart';
import 'package:provider/provider.dart';

class SelectionCategoryGrid extends StatelessWidget {
  const SelectionCategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _work = Provider.of<Update>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 12 * 7,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                  img(_work.getImages()[index]),
                  Text(
                    _work.getServices()[index],
                    softWrap: false,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ])),
            color: Colors.white,
            margin: const EdgeInsets.all(1.0),
          );
        },
      ),
    );
  }

  Widget img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.fill,
      height: 40,
      width: 40,
    );
  }
}

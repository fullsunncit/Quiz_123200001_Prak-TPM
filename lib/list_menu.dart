import 'package:flutter/material.dart';
import 'package:quiz/coffee_menu.dart';
import 'package:quiz/detail_coffee.dart';

class ListMenuKopi extends StatefulWidget {
  const ListMenuKopi({Key? key}) : super(key: key);

  @override
  State<ListMenuKopi> createState() => _ListMenuKopiState();
}

class _ListMenuKopiState extends State<ListMenuKopi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Main Page')),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final CoffeeMenu dataCoffee = coffeeList[index];
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailCoffee(dataTerima: dataCoffee);
                    }));
                  },
                  // child: ListTile(
                  //     title: Text(dataCoffee.name,
                  //         style: TextStyle(
                  //             fontSize: 18, fontWeight: FontWeight.bold)),
                  //     subtitle: Text('Price : ${dataCoffee.price}'),
                  //     leading: Card(
                  //       child: Image.network(dataCoffee.imageUrls[0],
                  //           width: 220, height: 120, fit: BoxFit.cover),
                  //     )
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(dataCoffee.imageUrls[0],
                          width: 220, height: 120, fit: BoxFit.cover),
                      Text("   "),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(dataCoffee.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Price : ${dataCoffee.price}'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: coffeeList.length,
          )),
    );
  }
}

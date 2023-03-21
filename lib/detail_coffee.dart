import 'package:flutter/material.dart';
import 'package:quiz/coffee_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCoffee extends StatefulWidget {
  final CoffeeMenu dataTerima;
  const DetailCoffee({Key? key, required this.dataTerima}) : super(key: key);

  @override
  State<DetailCoffee> createState() => _DetailCoffeeState();
}

class _DetailCoffeeState extends State<DetailCoffee> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page ${widget.dataTerima.name}"),
        ),
        body: Center(
          child: Container(
            width: 900,
            height: 500,
            padding: new EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 20,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(widget.dataTerima.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(widget.dataTerima.imageUrls[0],
                          width: 200, height: 130, fit: BoxFit.cover),
                      Image.network(widget.dataTerima.imageUrls[1],
                          width: 200, height: 130, fit: BoxFit.cover),
                      Image.network(widget.dataTerima.imageUrls[2],
                          width: 200, height: 130, fit: BoxFit.cover),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Description : ${widget.dataTerima.description}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Price : ${widget.dataTerima.price}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Ingredients : ${widget.dataTerima.ingredients[0]} ${widget.dataTerima.ingredients[1]}"
                        " ${widget.dataTerima.ingredients[2]} ${widget.dataTerima.ingredients[3]}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Nutrition : ${widget.dataTerima.nutrition}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Review Average : ${widget.dataTerima.reviewAverage}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Review Count : ${widget.dataTerima.reviewCount}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                        onPressed: (){
                          _launchURL(widget.dataTerima.linkStore);
                        },
                        child: Text("Link Store")
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/drink_detail.dart';
import '../ultils/detail_top_clipper.dart';

class DetailsPage extends StatelessWidget {
  final String id, url, name;

  const DetailsPage({
    Key key,
    this.id,
    this.url,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: DetailTopClippper(),
                    child: Container(
                      color: Colors.white,
                      child: Hero(
                        tag: id,
                        child: CachedNetworkImage(
                          imageUrl: url,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: -20,
                    child: FlatButton(
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.orange, width: 2)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: DrinkDetail.fetch(id),
                builder: (context, AsyncSnapshot<DrinkDetail> snapshot) {
                  if (snapshot.hasData) {
                    DrinkDetail drinkDetail = snapshot.data;

                    var ingredients = [
                      (drinkDetail.ingredients1 ?? '') +
                          " - " +
                          (drinkDetail.measure1 ?? ''),
                      (drinkDetail.ingredients2 ?? '') +
                          " - " +
                          (drinkDetail.measure2 ?? ''),
                      (drinkDetail.ingredients3 ?? '') +
                          " - " +
                          (drinkDetail.measure3 ?? ''),
                      (drinkDetail.ingredients4 ?? '') +
                          " - " +
                          (drinkDetail.measure4 ?? ''),
                      (drinkDetail.ingredients5 ?? '') +
                          " - " +
                          (drinkDetail.measure5 ?? ''),
                      (drinkDetail.ingredients6 ?? '') +
                          " - " +
                          (drinkDetail.measure6 ?? ''),
                      (drinkDetail.ingredients7 ?? '') +
                          " - " +
                          (drinkDetail.measure7 ?? ''),
                      (drinkDetail.ingredients8 ?? '') +
                          " - " +
                          (drinkDetail.measure8 ?? ''),
                      (drinkDetail.ingredients9 ?? '') +
                          " - " +
                          (drinkDetail.measure9 ?? ''),
                      (drinkDetail.ingredients10 ?? '') +
                          " - " +
                          (drinkDetail.measure10 ?? ''),
                      (drinkDetail.ingredients11 ?? '') +
                          " - " +
                          (drinkDetail.measure11 ?? ''),
                      (drinkDetail.ingredients12 ?? '') +
                          " - " +
                          (drinkDetail.measure12 ?? ''),
                      (drinkDetail.ingredients13 ?? '') +
                          " - " +
                          (drinkDetail.measure13 ?? ''),
                      (drinkDetail.ingredients14 ?? '') +
                          " - " +
                          (drinkDetail.measure14 ?? ''),
                      (drinkDetail.ingredients15 ?? '') +
                          " - " +
                          (drinkDetail.measure15 ?? ''),
                    ]..removeWhere((value) => value == " - ");

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SelectableText(
                            drinkDetail.name,
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 24,
                              letterSpacing: 2,
                            ),
                            cursorColor: Colors.orange,
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                          ),
                          Text(
                            "\nIngredients: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SelectableText(
                            ingredients.join('\n'),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                            cursorColor: Colors.orange,
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                          ),
                          Text(
                            "\nInstructions: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SelectableText(
                            drinkDetail.instructions,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                            cursorColor: Colors.orange,
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        )
                      ],
                    );
                  }
                  return SelectableText(
                    name,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 24,
                      letterSpacing: 2,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

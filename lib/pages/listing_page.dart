import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/drink.dart';
import '../ultils/faded_page_route.dart';
import 'details_page.dart';

class ListingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 200,
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.search,
              color: Colors.orange,
            ),
            onPressed: () {
              print("Pressed search");
            },
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
            future: Drink.fetch(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List> snapshot,
            ) {
              if (snapshot.hasData) {
                List drinks = snapshot.data;
                return ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    Drink drink = drinks[index] as Drink;
                    return ListTile(
                      leading: Hero(
                        tag: drink.id,
                        child: CachedNetworkImage(
                          imageUrl: drink.url,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                      title: Text(drink.name),
                      subtitle: Divider(color: Colors.grey),
                      onTap: () {
                        Navigator.push(
                          context,
                          FadedPageRoute(
                            widget: DetailsPage(
                              id: drink.id,
                              name: drink.name,
                              url: drink.url,
                            ),
                          ),
                        );
                        print("Tapped " + drink.name);
                      },
                    );
                  },
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: Text('Awaiting result...'),
                  )
                ],
              );
            }),
      ),
    );
  }
}

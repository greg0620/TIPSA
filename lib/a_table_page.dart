import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tipsa/defis.dart';
import 'package:tipsa/new_feed.dart';
import 'package:tipsa/outils.dart';
import 'favorite_page.dart';
import 'petit_dejeuner_page.dart';
import 'dejeuner_page.dart';
import 'diner_page.dart';
import 'social_page.dart';

final List<Widget> pages = [
  MyPetitDPage(),
  MyDejeunerPage(),
  MyDinerPage(),
];
final List<String> imagesList = [
  'https://sf.ezoiccdn.com/ezoimgfmt/www.healthymood.fr/wp-content/webp-express/webp-images/uploads/Gaufres.jpg.webp?ezimgfmt=rs:455x304/rscb1/ng:webp/ngcb1',
  'https://www.mangerbouger.fr/manger-mieux/la-fabrique-a-menus/_next/image?url=https%3A%2F%2Fapi-prod-fam.mangerbouger.fr%2Fstorage%2Frecettes%2Ftarte-aux-carrotes-salade.jpg&w=1200&q=75',
  'https://www.mangerbouger.fr/manger-mieux/la-fabrique-a-menus/_next/image?url=https%3A%2F%2Fapi-prod-fam.mangerbouger.fr%2Fstorage%2Frecettes_generiques%2Fplatcomplet.png&w=1200&q=75',
];
final List<String> titles = [
  'Petit-déjeuner',
  'Déjeuner',
  'Diner',
];
final List<String> recette = [
  'Gauffre à la banane',
  'Tartes aux carottes et salade',
  'Poulet au riz complet et poireaux',
];
final List<String> description = [
  'Temps de préparation : 20min',
  'Temps de préparation : 1h10min',
  'Temps de préparation : 35min',
];
void aTablePage(){
  runApp(MyATablePage());
}
class MyATablePage extends StatefulWidget {
  @override
  _MyATablePageState createState() => _MyATablePageState();

}
class _MyATablePageState extends State<MyATablePage> {
  int _currentIndex = 0;
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SocialPage()
              ),
            );
          },
          child: const Text('Deconnexion'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:  Image.asset('assets/images/logo.png'),
        title: Text("A Tables"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.bookmark_border),
        onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyFavoritePage(),
          ),
        );
        },
        backgroundColor: Colors.green,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
            height: height,
            autoPlay: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            onPageChanged: (index,reason) {
              setState(
                    () {
                  _currentIndex = index;
                },
              );
            }
        ),
        items: imagesList
            .map(
              (item) => Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              margin: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
              ),
              elevation: 1.0,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height:250 ,
                    ),
                    Center(
                      child : Container(
                        child : Column(
                            children:[
                              SizedBox(height: 250),
                              TextButton(
                                child: Text(
                                  titles[_currentIndex],
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => pages[_currentIndex]),
                                  );
                                },
                              ),
                              Text(
                                recette[_currentIndex],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 40),
                              Text(
                                description[_currentIndex],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 60,),
                              LikeButton(
                                likeCount: 0,
                              ),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), // ignore: avoid_unnecessary_containers
        )
            .toList(),
      ),
      bottomNavigationBar: ButtonBar(
        children: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyNewFeedPage(),
                ),
              );
            },
            icon: const Icon(Icons.home),
            color:Colors.blue ,
          ),
          IconButton(
            icon: const Icon(Icons.fastfood),
            color:Colors.green ,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyATablePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.sports_cricket),
            color: Colors.deepOrange,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyDefisPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.view_agenda_outlined),
            color: Colors.purple ,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyOutilsPage(),
                ),
              );
            },
          ),
        ],
        alignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}
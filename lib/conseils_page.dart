import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tipsa/defis.dart';
import 'package:tipsa/new_feed.dart';
import 'package:tipsa/outils.dart';
import 'favorite_page.dart';
import 'a_table_page.dart';
import 'social_page.dart' ;

void conseilsPage(){
  runApp(MyConseilsPage());
}
class MyConseilsPage extends StatefulWidget {
  @override
  _MyConseilsPageState createState() => _MyConseilsPageState();

}
class _MyConseilsPageState extends State<MyConseilsPage> {
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
        automaticallyImplyLeading: true,
        title: Text("Le conseil du jour"),
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
      ),
      body: Container(
        height: height,
        child: Column(
          children :[
            SizedBox(height: 5,),
            Image.network('https://media.istockphoto.com/id/1180451829/fr/photo/homme-gros-utile-courant-dans-le-stationnement-essouffl%C3%A9-motivation-persistante.jpg?s=170667a&w=0&k=20&c=zrQCcg5gmKw90_TzD3eIIBKu9wGmnkbvQPg2bvXm4rM=',
            ),
            SizedBox(height: 10,),
            Text(
              'La motivation avant tout !',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Bouge tous les jours, c'est la clé de la réussite !",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50,),
            Text(
              "Il est, par exemple, plus intéressant pour ta santé d'aller chaque jour à pied au collège ou au lycée et de te balader le week-end avec ta famille, que de faire seulement 2 heures de sport dans la semaine et de rester sédentaire le reste du temps.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50,),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                LikeButton(
                  likeBuilder: (isTapped){
                    return Icon(
                      Icons.bookmark,
                      color: isTapped ? Colors.blue : Colors.black,
                    );
                  },
                ),
                LikeButton(
                  likeCount: 0,
                ),
              ],
            ),
          ],
        ),
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
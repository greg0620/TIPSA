import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'favorite_page.dart';
import 'a_table_page.dart';
import 'outils.dart';
import 'defis.dart';
import 'new_feed.dart';
import 'social_page.dart';

void citationsPage(){
  runApp(MyCitationsPage());
}
class MyCitationsPage extends StatefulWidget {
  @override
  _MyCitationsPageState createState() => _MyCitationsPageState();

}
class _MyCitationsPageState extends State<MyCitationsPage> {
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
        title: Text("La citation du jour"),
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
            Image.network('https://cdn.pixabay.com/photo/2018/05/15/17/08/motivational-quote-3403638__340.jpg',
              ),
            SizedBox(height: 10,),
            Text(
              'Martin Luther King',
              style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          textAlign: TextAlign.center,
        ),
            SizedBox(height: 50,),
            Text(
              "Crois en tes rêves et ils se réaliseront peut-être. Crois en toi et ils se réaliseront sûrement.",
              style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            ),
           SizedBox(height: 150,),
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
      bottomNavigationBar:
      ButtonBar(
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
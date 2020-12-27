import 'package:flutter/material.dart';
import 'package:tp_liste_de_carte/Contact.dart';
import 'package:validators/validators.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My liste',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My liste '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final List contactList = <Contact>[];

 Contact _generationOfContact() {
   int randomInt = Random().nextInt(100000000 - 1000000);
    return  new Contact(randomInt, WordPair.random());
  }
 Widget generateCard(Contact contact){
  return  Container(
        color: Colors.greenAccent,
        child: Card(
          color: Colors.amber,
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Text(contact.Lettres),
            ),
            title: Text(contact.pair.asPascalCase),
            subtitle: Text('+336' + contact.randomInt.toString()),
            trailing: Icon(Icons.more_vert),
          ),
        ));
  }


    @override
    Widget build(BuildContext context) {


      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            //itemCount: contactList.length,
            itemBuilder: (context, index) {

                if (index >= contactList.length) {
                 contactList.add(_generationOfContact());
              }
              return generateCard(contactList[index]);
            } ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepOrange[300],
                    Colors.deepOrange,
                  ],
                )),
            child: ListView(children: <Widget>[
              DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: ExactAssetImage(
                          'img/portrait.jpg',
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Ce bon vieux phifi",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "+00000000000",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ]),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }

import 'package:flutter/material.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/screens/menu/squad/player.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class Squad extends StatefulWidget {
  @override
  _SquadState createState() => _SquadState();
}

class _SquadState extends State<Squad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25,),
            Align(alignment: Alignment.centerRight,child: Text('סגל הקבוצה  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold', fontSize: 38, color: Colors.red[900]))), SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/samuel.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'אסף סמואל', height: '1.80', image: 'assets/players/samuel2.jpg', date: '27/04/94', position: 'גארד', text: 'הפועל ב"ש', videoURL: 'https://youtu.be/hzUfHBg5dWo', imageVideo: 'assets/players/samuel3.jpeg')));
                    },),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/kolman.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'אלונזו קולמן', height: '2.03', image: 'assets/players/kolman2.jpg', date: '10/05/89', position: 'סנטר', text: 'מכללת פרסבייטרן(ארה"ב)\nבנדה נורטו ריו קווארטו (ארגנטינה)\nוילפאס(פינלנד), מכבי רחובות, רואן(צרפת)\nהפועל עפולה', videoURL: 'https://youtu.be/vGD6DZkElwk', imageVideo: 'assets/players/kolman3.jpg')));
                    },),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/halamish.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'גל חלמיש', height: '1.93', image: 'assets/players/halamish2.jpg', date: '16/08/91', position: 'סמול פורוורד', text: 'אליצור קריית אתא, הפועל עפולה\nבני הרצליה, מכבי רעננה', videoURL: 'https://youtu.be/VjTATBpzUnU', imageVideo: 'assets/players/halamish3.jpeg')));
                    }),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/solomun.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'אור סולומון', height: '2.02', image: 'assets/players/solomun2.jpg', date: '27/08/93', position: 'פאוור פורוורד', text: 'מכבי ראשל"צ, עירוני נס ציונה, מכבי אשדוד\nמכבי קריית גת, הפועל ב"ש, עירוני נהריה', videoURL: 'https://youtu.be/BghGaFQ_zGI', imageVideo: 'assets/players/solomun3.jpeg')));
                    },),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/paltin.jpeg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'גיא פלטין', height: '1.92', image: 'assets/players/paltin2.jpg', date: '25/09/00', position: 'גארד', text: 'הפועל חולון', videoURL: 'https://youtu.be/9EbCpRuaPto', imageVideo: 'assets/players/paltin3.jpg')));
                    }),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/drucker.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'תומר דרוקר', height: '1.85', image: 'assets/players/drucker2.jpg', date: '10/11/98', position: 'גארד', text: 'מכבי שוהם', videoURL: 'https://www.youtube.com/watch?v=ouabFiPEEE4', imageVideo: 'assets/players/drucker3.jpeg')));
                    }),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/manski.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'אורן מנסקי', height: '1.90', image: 'assets/players/manski2.jpg', date: '31/07/85', position: 'סמול פורוורד', text: 'הוד השרון, באר טוביה, רמת השרון', videoURL: 'https://youtu.be/r7v9lV15HJg', imageVideo: 'assets/players/manski3.jpg')));
                    }),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/lerer.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'איתי לרר', height: '1.97', image: 'assets/players/lerer2.jpg', date: '19/04/94', position: 'גארד', text: 'שחקן בית', videoURL: 'https://youtu.be/lXRKHcJtFy4', imageVideo: 'assets/players/lerer3.jpeg')));
                    }),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/capers.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'קווין קייפרס', height: '1.88', image: 'assets/players/capers2.jpg', date: '02/05/93', position: 'גארד', text: 'וסטצסטר ניקס\nסיודד אובורגון (מקסיקו, ליגה ראשונה)\nסיביו (רומניה, ליגה ראשונה)\nIR רייקיאוויק (איסלנד, ליגה ראשונה)', videoURL: 'https://youtu.be/RfG5NqFX6Ek', imageVideo: 'assets/players/capers3.jpeg')));
                    }),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/mayor.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'איגור מאיור', height: '1.93', image: 'assets/players/mayor2.jpeg', date: '15/08/93', position: 'גארד', text: 'עירוני ר"ג, מכבי הוד"ש, אליצור יבנה\nהפועל ירושלים, אליצור איתו אשקלון', videoURL: 'https://youtu.be/CtMQelkIYuU', imageVideo: 'assets/players/mayor3.jpg')));
                    }),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/mutsafi.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'אופיר מוצפי', height: '1.95', image: 'assets/players/mutsafi2.jpg', date: '02/01/00', position: 'גארד', text: 'שחקן בית', videoURL: '', imageVideo: '')));
                    }),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/zach.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'טל זך', height: '2.08', image: 'assets/players/zach2.jpg', date: '07/11/97', position: 'פאוור פורוורד', text: 'הפועל מגדל העמק, הפועל חולון\nאליצור איתו אשקלון', videoURL: 'https://youtu.be/HJ7iOt8Xn9U', imageVideo: 'assets/players/zach3.jpeg')));
                    }),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/zalmanson.jpeg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'תומר זלמנסון', height: '1.94', image: 'assets/players/zalmanson2.jpeg', date: '23/06/98', position: 'גארד', text: 'מכבי ת"א, עירוני ר"ג\nמכבי קריית גת, אליצור יבנה', videoURL: 'https://youtu.be/k7_XHFBK-8c', imageVideo: 'assets/players/zalmanson3.jpg')));
                    }),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(child: Image.asset('assets/players/elkayam.jpg'), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Player(name: 'נדב אלקיים', height: '1.81', image: 'assets/players/elkayam2.jpg', date: '16/12/99', position: 'פאוור פורוורד', text: 'שחקן בית', videoURL: '', imageVideo: '')));
                    }),
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),
            Align(alignment: Alignment.centerRight,child: Text('צוות מקצועי  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold', fontSize: 38, color: Colors.red[900]))), SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Image.asset('assets/cohen.jpeg'),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Image.asset('assets/hirshovitz.jpeg'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Image.asset('assets/ben-zion.jpeg'),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Image.asset('assets/granot.jpeg'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
              child: Container(),
            ),
              Expanded(
                  child: Card(
                    child: Image.asset('assets/atlas.jpeg'),
                  ),
                )
              ],
            ),
            SizedBox(height: 40,)
          ],
        )
      ),
    );
  }
}


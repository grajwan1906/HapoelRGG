import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class ClubHolders extends StatefulWidget {
  @override
  _ClubHoldersState createState() => _ClubHoldersState();
}

class _ClubHoldersState extends State<ClubHolders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    child: Image.asset('assets/club_holders.jpg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,child: Text('דירקטוריון העמותה  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 25,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          child: Image.asset('assets/kol.jpeg'),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Image.asset('assets/ben_yosef.jpeg'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          child: Image.asset('assets/ben_ami.jpeg'),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Image.asset('assets/glitzki.jpeg'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          child: Image.asset('assets/rozenberg.jpeg'),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Image.asset('assets/frishman.jpeg'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('תפקידים נוספים  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('שרה דגן – מזכירת המועדון\nעידו אופן – מנהל רשתות חברתיות\nאופיר דיאמנט – מנהל שיווק\nאבי ריימונד – עורך וידאו\nליעד אלקבץ – צוות שיווק\nעומרי אשכנזי – מנהל עמוד אינסטגרם\nרועי וירצר – צוות אתר\nאסף ברגר – צוות אתר\nרז פלדמן – מעצב גרפי\nגיא רג\'ואן – מפתח אפליקציה\nעודד וסינדי שמואלי – צוות תפעול\nעופר טראב – צוות תפעול\nנמרוד קמחי – צלם\nרז עזיז – צלם\nתומר אטלס – סקאוט ראשי\nרו"ח אמינוב – ידיד\n\nכל חברי הדירקטריון ונושאי התפקידים הנוספים הינם מתנדבים ללא שכר בעמותה.', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


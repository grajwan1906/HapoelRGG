import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class The70s extends StatefulWidget {
  @override
  _The70sState createState() => _The70sState();
}

class _The70sState extends State<The70s> {

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
                    child: Image.asset('assets/the70s.jpg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1973/74:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 4 (מאזן 7:15). ניצחון בולט: על הפועל גבת 68:82. שחקנים: אהרון צחנובסקי, אורי זילברמן, אריה מליניאק, גורג אקוש, שלמה בלום, סטיב קפלן, חנוך מינץ, בני שופר, אדוארד טרייס, אורי רבינרזון, אילן סגל, גיורא גולדרייך, יגאל הוך, פלקוביץ, שלמה חצבני. מאמן: צבי לובצקי.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1974/75:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 5:21). ניצחון בולט: על מכבי ת"א 89:93 ועל מכבי ר"ג 94:101. שחקנים: אהרון צחנובסקי, אורי זילברמן, אילן סגל, אריה מליניאק, בני שופר, גורג אקוש, לארי גוטליב, חנוך מינץ, חנן קרן, סטיב קפלן, דניס רייקין, שלמה בלום.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1975/76:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 4 (מאזן: 7:17). ניצחון בולט: על הפועל ת"א 79:95. שחקנים: אהרון צחנובסקי, אילן סגל, אריה מליניאק, ברוך שופטי, גורג אקוש, לארי גוטליב, חנן אינדיבו, חנן קרן, יוסי קאשי, לורנס שולדברנד, סטיב קפלן, שלמה בלום.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1976/77:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 3:17). ניצחון בולט: על מכבי ת"א 76:81. שחקנים: אילן סגל, אילן פלג, אריה מליניאק, ארנון מוזס, ברוך שופטי, חנן קרן, לורנס שולדברנד, סטיב קפלן, סטיב שלכטר, רוי וול, רוני לנג, שלמה בלום.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1977/78:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 4:18). ניצחון בולט: על מכבי ת"א 81:87. שחקנים: פנחס אדרי, אילן סגל, צארלי דייויס, זוהר צימבליסט, יהודה לוי, יוסי קאשי, סטיב קפלן, סטיב שלכטר, קמיל דירקס, רוי וול, רוני לנג, שמריהו זסלבסקי.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1978/79:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 4:19). במסגרת סדרות הגמר על האליפות הודחה ר"ג בחצי הגמר ע"י הפועל ת"א. ניצחון בולט בליגה: על הפועל ת"א 87:109. שחקנים: אביגדור מוסקוביץ, צארלי דייויס, זוהר צימבליסט, יהודה לוי, יוסי קאשי, ניל וולק, סטיב קפלן, סטיב שלכטר, עודד גינדין, עודד עורף, רוזנפלד, רוזנצווייג, רוי וול, שמואל קאופמן. גמר גביע המדינה: הפסד 73:66 למכבי ת"א.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


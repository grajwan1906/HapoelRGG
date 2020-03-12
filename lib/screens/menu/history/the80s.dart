import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class The80s extends StatefulWidget {
  @override
  _The80sState createState() => _The80sState();
}

class _The80sState extends State<The80s> {

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
                    child: Image.asset('assets/the80s.jpg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1979/80:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 3 (מאזן: 3:17). ניצחון בולט: על מכבי ת"א 88:91. שחקנים: אביגדור מוסקוביץ, אייל רוזנפרב, אל פלמינג, יצחק ארואסטי, זוהר צימבליסט, יהודה לוי, יוסי קאשי, ניל וולק, סטיב קפלן, סטיב שלכטר, עודד גינדין, שמואל קאופמן. גמר גביע המדינה: הפסד 105:87 למכבי ת"א.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1980/81:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 3:19). ניצחון בולט: על הפועל עפולה 80:89. שחקנים: אביגדור מוסקוביץ, אור גורן, אייל רוזנפרב, אל פלמינג, זוהר צימבליסט, יהודה לוי, יוסי קאשי, ניל וולק, סטיב קפלן, סטיב שלכטר, רוני כהן, שמואל קאופמן. מאמן: אייבן דאנקן. גמר גביע המדינה: הפסד 105:95 למכבי ת"א.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1981/82:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 3:19). ניצחון בולט: על הפועל ת"א 95:99. שחקנים: אביגדור מוסקוביץ, אור גורן, אורי זילברמן, אייל רוזנפרב, אילן בינס, יהודה לוי, יוסי קאשי, סטיב מאלוביק, סטיב קפלן, סטיב שלכטר. מאמן: צביקה שרף. הפסד בגמר גביע המדינה: 90:77 למכבי ת"א.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1982/83:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 3 (מאזן: 6:16). הקבוצה הפסידה בסדרת הגמר פעמיים למכבי ת"א. ניצחון בולט: על הפועל ת"א 72:101. שחקנים: אביגדור מוסקוביץ, אור גורן, דייויד רוס, מאיר הייניק, יהודה לוי, יוסי קאשי, סטיב קפלן, סטיב שלכטר, קורקי נלסון, קליף פונדקסטר, רוני בוסאני. מאמן: צביקה שרף.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1983/84:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 2 (מאזן: 3:19). ניצחון בולט: על הפועל ת"א 75:76. שחקנים: אביגדור מוסקוביץ, פנחס אדרי, אור גורן, הארט האוזי, דייויד רוס, זיו קושניר, יוסי קאשי, סטיב מאלוביק, סטיב קפלן, סטיב שלכטר. מאמן: שימי ריגר. גמר גביע המדינה: הפסד 79:73 להפועל ת"א. עונת 1984/85: מקום בליגה: 8 (מאזן: 12:10). הקבוצה נוצחה ברבע הגמר של סדרת הגמר-סל ע"י מכבי ת"א. ניצחון בולט בליגה: על מכבי ר"ג 82:88. שחקנים: אביגדור מוסקוביץ, אור גורן, אורי בן ארי, אייל ארד, הארט האוזי, גבי ברסלר, יוסי קאשי, סטיב מאלוביק, סטיב קפלן, סטיב שלכטר. מאמן: גרשון דקל, רודי דאמיקו.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1985/86:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 10 (מאזן: 15:5). ניצחון בולט: על מכבי ר"ג 89:96. שחקנים: אביגדור מוסקוביץ, אברמוב, אורי בן ארי, גרי מלינסון, דני דדוש, יגדורוב, יצחקי, יוסי קאשי, סטיב שלכטר, עוז ויגודמן, יובל פרידברג, קיט בנט, קרל מקפייפ, ריקי טאונסל. מאמן: אברהם חמו, אריה מליניאק, סטיב קפלן.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1985/86:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 10 (מאזן: 15:5). ניצחון בולט: על מכבי ר"ג 89:96. שחקנים: אביגדור מוסקוביץ, אברמוב, אורי בן ארי, גרי מלינסון, דני דדוש, יגדורוב, יצחקי, יוסי קאשי, סטיב שלכטר, עוז ויגודמן, יובל פרידברג, קיט בנט, קרל מקפייפ, ריקי טאונסל. מאמן: אברהם חמו, אריה מליניאק, סטיב קפלן.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


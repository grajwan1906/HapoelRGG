import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class The60s extends StatefulWidget {
  @override
  _The60sState createState() => _The60sState();
}

class _The60sState extends State<The60s> {

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
                    child: Image.asset('assets/the60s.jpg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1959/60:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 8 (מאזן: 13:9). ניצחון בולט: שחקנים: ברוך טילבור, גוייר, וייסמן, ויקטור כהן, יצחק אלוני, יצחק פוקס, ישראל אגסי, כץ, מרדכי כהן, משה אברמוביץ, עמוס קמינר, עמרם קנישינסקי, רוני כהן, רענן כץ.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('העלייה לליגה הראשונה ב-1973 לא היתה הפעם אפיזודה חולפת. ראשי הקבוצה בנו סגל טוב, שהצליח לתקוע יתד בליגה ובהמשך התחזק והפך לקבוצה מצוינת.לקבוצה הצטרף סטיב קפלן, שעלה מארה"ב והפך לעוגן המרכזי וללב של הקבוצה. "ראש העיר", שרו לו האורדונים, וקפלן לא איכזב. ב-12 העונות בהן שיחק בר"ג היה מלך הסלים הקבוע שלה, ועוד חמש פעמים ברציפות של הליגה כולה – 5,913 נקודות בקריירה ( עוד לפני עידן 3 הנקודות!) ומקום 8 בטבלת קולעי כל הזמנים בישראל.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1960/61:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 12, אחרון (מאזן: 18:4). ניצחון בולט: על משמר העמק 46:81. שחקנים: איתן מגידו, ברוך טילבור, גנון, זמיר גורי, יצחק אלוני, יצחק פוקס, ישראל אגסי, לוין, מיליקובסקי, מרדכי כהן, עמוס קמינר, עמרם קנישינסקי, רוזן, רוני כהן.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('עונת 1964/65:  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מקום בליגה: 12, אחרון (מאזן: 22:4). ניצחון בולט: על גבעת חיים 64:66. שחקנים: אברהם ישראל, אהוד דרור, איתן מגידו, ברוך טילבור, ברק, דב כהן, וייסמן, זמיר, חגי ארליך, זמיר גורי, יוסף פרנק, ישראל אגסי, מיכאל בלומנטל, מרדכי כהן, עמוס רובינשטיין, רוני כהן, שאול סוקניק, תנחום אבן טוב, שנולק.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


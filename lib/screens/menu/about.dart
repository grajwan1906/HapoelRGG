import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

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
                    child: Image.asset('assets/about.jpg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,child: Text('בשנת 2009 הקים הדור הצעיר של אוהדי הפועל רמת גן – גבעתיים את עמותת "המכתש" מתוך מטרה לשמר ולהמשיך את המורשת הספורטיבית של האגודה המפוארת. כשנתיים מאוחר יותר, החייתה העמותה את מועדון הכדורסל ההיסטורי וכיום היא מחזיקה ב-100% ממניות הקבוצה. בעמותה חברים אוהדי הפועל ר"ג – גבעתיים מכל הגילאים. שמה של העמותה שונה וכיום היא נקראת "עמותת הפועל רמת גן גבעתיים בכדורסל".  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('הנהלת המועדון, שחקניה ואוהדיה, משתתפים מדי שנה באיסוף מזון למען נזקקים לחג הפסח שיוזם המועדון, ומדי עונה הקבוצה תורמת עשרות מנויים לאגף הרווחה בעיר בחסות האוהדים. רוח ההתנדבות היא חלק בלתי נפרד מהפרוייקט שלנו ומהלכים כאלו ודומים להם ימשיכו להתקיים גם בעתיד.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('אבל למה בעצם?  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('בתקופות בהם אנו עדים לאנשי ספורט ואירועי אלימות שמבריחים אוהדים מהיציעים, אנו גאים להיות נקודת האור שמראה שאפשר לעשות ספורט גם אחרת, מאהבה ובכיף. בהפועל שלנו יש משהו קסום. היא מוקפת אנרגיות שבאמת קשה לנו להסביר במילים. עיקר הקסם מגיע מהיציע שלנו שהוא למעשה משפחה אחת גדולה. מדי שבוע מגיעים למשחקי הקבוצה מאות "אוּרדוּנים" שרופים שממשיכים לשיר גם כשהקבוצה בפיגור, חברי ההנהלה הם חלק קבוע מהיציע וכשהמשחק מתחמם זה לא מחזה נדיר שתראו את חלקם עומדים על המעקה צועקים, את השחקנים שלנו תמצאו בסוף המשחק בתוך היציע קופצים עם האוהדים.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('הפועל ר"ג-גבעתיים היא המשפחה השניה של כולנו והיא מרגשת אותנו בכל שבוע מחדש. ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('לאן מועדות פנינו  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('חלומה של העמותה הוא להחזיר את הפועל ר"ג – גבעתיים לפסגת הכדורסל הישראלי, להוביל את המועדון לזכייה בתארי אליפות וגביעים שהוחמצו בגלגולה הקודם ולשמר את פעילות הכדורסל של המועדון בקבוצות ילדים, נוער ובוגרים.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('אבל זה לא רק התאווה לתארים, למעשה זה הרבה מעבר לזה. הכיף, האנרגיות, השירים והקהילה – הכל מגיע מהיציע שלנו, המגוון באנשים שונים ולעיתים משונים, שהופכים את הקבוצה לאחת הצבעוניות והייחודיות בישראל. בדרך לפסגה אנחנו מחוייבים להמשיך ולהגדיל את היציע שלנו תוך שמירה על המאפיינים הקיימים שלו. ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('מרגע הקמתה הקבוצה פעלה ותמשיך לפעול בשילוב ידיים עם עיריות ר"ג וגבעתיים וזאת לצד התקשרות עם גורמים עסקיים אשר נרתמים לעזור ולסייע לנו להגשים את החזון למען הקהילה. ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


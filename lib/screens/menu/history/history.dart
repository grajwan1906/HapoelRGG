import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

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
                    child: Image.asset('assets/history.jpeg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,child: Text('"מהי היסטוריה אם לא אגדה שהכל הסכימו עליה?"  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('ברוכה השבה – אימפריית הכדורסל האדומה של הפועל ר"ג-גבעתיים. בשנות ה-70 וה-80 היא היתה בובה של קבוצה, חלומו של כל אוהד, מוכשרת ומטריפה מאין כמוה, שבמשך כמה עונות איימה לקחת את האליפות ממכבי ת"א. אבל יום אחד נגמר הכסף, אזלו האנרגיות, הקבוצה התפרקה והלך החלום. כ-25 שנים היתה הפועל ר"ג-גבעתיים מוטלת במחסן הגרוטאות, עד שכמה אוהדים החליטו להקים אותה מחדש ולצאת לדרך מליגה ב. הענק הלוחש התעורר מחדש ומבטיח שההווה והעתיד שלו לא יביישו את העבר.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('כך זה החל  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('הפועל ר"ג בכדורסל נוסדה ב-1957. לאחר שלוש שנים עלתה לליגה הראשונה. ירדה, שוב עלתה, התנדנדה בין הליגות וחיכתה לזינוק הגדול. בעונת 1972-73 שבה הקבוצה לליגה הראשונה, עם שלמה בלום הלוהט מתחת לסלים ועם שמוליק יעקובסון על הקווים. ותיקי האוהדים לא ישכחו את משחקי הבית במגרשים הפתוחים – תחילה בביה"ס קלעי ובהמשך בשיכון חברת החשמל בגבעתיים. במגרשים אלה, כולל איצטדיון המכתש, התגבשה רוח היחידה של אוהדי הפועל ר"ג ונצרבו זכרונות נפלאים מימים של פעם.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('העלייה לליגה הראשונה ב-1973 לא היתה הפעם אפיזודה חולפת. ראשי הקבוצה בנו סגל טוב, שהצליח לתקוע יתד בליגה ובהמשך התחזק והפך לקבוצה מצוינת.לקבוצה הצטרף סטיב קפלן, שעלה מארה"ב והפך לעוגן המרכזי וללב של הקבוצה. "ראש העיר", שרו לו האורדונים, וקפלן לא איכזב. ב-12 העונות בהן שיחק בר"ג היה מלך הסלים הקבוע שלה, ועוד חמש פעמים ברציפות של הליגה כולה – 5,913 נקודות בקריירה ( עוד לפני עידן 3 הנקודות!) ומקום 8 בטבלת קולעי כל הזמנים בישראל.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('תקופת הזוהר  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('ימיה הגדולים של הפועל ר"ג בכדורסל נמשכו כעשור, מאמצע שנות ה-70 ועד אמצע שנות ה-80. מסביבו של קפלן נבנתה קבוצה גדולה. בין היתר כיכבו בה במשך השנים סטיב שלכטר, אביגדור מוסקוביץ, סטיב מאלוביק, אור גורן, חנן קרן, צמד המקומיים יוסי קאשי ויהודה לוי, ומדי עונה גם שחקן זר בולט. עם זאת, הקבוצה חסרה תמיד עומק בספסל.מיטב המאמנים עברו בה, ביניהם האוהד אריה מליניאק, המכביסט צביקה שרף, שימי ריגר, אייבן דאנקן ורודי דאמיקו.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('שיירות של אוהדים מגבעתיים ור"ג נהרו למשחקי הבית בהיכל הספורט ביד אליהו, ליוו את הקבוצה באשר תלך ודחפו אותה בדומיננטיות אל צמרת הליגה, כולל במשחקים במסגרת האירופית של גביע קוראץ (היורוקאפ של אותה תקופה).הקבוצה לא איכזבה ודרסה כמעט את כל מי שנקרתה בדרכה. היא הדיחה מההגמוניה העירונית את מכבי ר"ג האגדית, הלמה באוסישקין בהפועל ת"א, הותירה אבק למעוזי הקיבוצים ורשמה חמש הופעות בגמר גביע המדינה.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('המאבקים הלוהטים ביותר שלה היו מול מכבי ת"א, שבאותן שנים הפכה ל"קבוצה של המדינה" וכללה שמות גדולים (מיקי, מוטי, אולסי, ארל, סילבר ובוטרייט) כשעל הקווים מנהל שמעון מזרחי את העניינים, ואפילו את השופטים. כמעט מדי עונה ניצחה ר"ג את מכבי ת"א, כשבאחד משיאיה הדיחה אותה ב-1984 בחצי גמר גביע המדינה (בגמר הפסידה להפועל ת"א). היריבות הגדולה על הפרקט הושפעה גם מהיריבות העצומה ביציעים בין אוהדי שתי הקבוצות, שהפכה לשנאה והיא ניכרת עד היום. בסיכומו של דבר, על אף המאבקים הצמודים עם מכבי ת"א, לא הצליחה הפועל ר"ג לזכות באליפות, וגם לא בגביע.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),
                  Align(alignment: Alignment.centerRight,child: Text('סופה של אגדה  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,child: Text('השאיפה הגדולה להצליח לסיים ראשונה בליגה הפכה למעין אובססיה. בעקבותיה נולדה "אגודת הידידים" של הקבוצה, כאשר היו"ר איתן מגידו רתם פוליטיקאים ושועים שתרמו כספים על מנת להגשים את החלום. ההשקעה האדירה בקבוצה צברה גרעונות. בחירתו לראשות עיריית ר"ג של אורי עמית, מזכיר מועצת הפועלים, הגוף שתחת חסותו ומימונו נוהל מועדון הפועל ר"ג כולו, יצרה תקווה מחודשת עבור קבוצת הכדורסל, אבל המציאות היתה אחרת: "הידידים" נעלמו, צינור הכסף נגדע, אנשים מטעם העירייה נכנסו לניהול, הקבוצה החלה לחרוק ומשם להידרדר ללא מעצורים עד שתוך זמן קצר התפרקה והתחסלה. באחד מניסיונות ההחייאה של הקבוצה תיזכר יוזמתו של המאמן אברהם חמו להביא את כוכב הכדורסל שוגר ריי ריצרדסון, שנזרק מה-NBA על סמים. השחקן נענה לאתגר ונחת בארץ באוקטובר 1986, אבל אז הודיעה פיב"א (בלחץ מכבי ת"א) כי אין אישור לשתפו. הקבוצה ירדה באותה עונה לליגה השנייה, ומאז נעלמה.  ', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 15,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


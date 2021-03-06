import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';

import '../utils/SizeConfig.dart';
import 'MessageDetailPage.dart';

class MessagesList extends StatefulWidget {
  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  static final facebookAppEvents = FacebookAppEvents();
  var data = [
    "जन्माष्टमी के इस अवसर पर , हम ये कामना करते हैं कि श्री कृष्ण की कृपा आप पर, और आपके पूरे परिवार पर हमेशा बनी रहे।\nशुभ जन्मआष्टमी!",
    "फिर कृष्ण जन्माष्टमी आयी है,\nमाखन की हांडी ने फिर मिठास बढ़ाई है\nकान्हा की लीला है सबसे प्यारी,\nवो दे तुम्हे दुनिया भर की खुशिया सारी।।\nनन्द के लाला को हमारा बार-बार नमस्कार।।",
    "​Murli Manohar… Giridhara Gopala… Govinda Hari… This Janmashtami, as you chant the items of Shri Lord Krishna… May he shower upon you his divine blessings. Happy Krishna Janmashtami!",
    "​May Lord Krishna steal all your tensions and worries… And give you all the love, peace, and happiness on this holy occasion of Krishna Janmashtami.",
    "​On this Janmashtami may all your wishes come true and may Nand Gopal shower his blessings on you and your loved ones! Happy Janmashtami!",
    "​May Lord Krishna be with you and your family, always! Blessings of Health, Wealth, Love, and Happiness. Happy Janmashtami!",
    "​Hare Krishna, Hare Krishna… Krishna Krishna, Hare Hare… Wishing you a happy and blessed Krishna Janmashtami!",
    "​May the blessings of Lord Krishna fill your life with Happiness and Virtues on this Krishna Janmashtami.",
    "Natkhat Kanha aaye dwaar\nLekar apni bansuri saath\nMor mukut sar par sohe\nAur aankhon me kajal ki dhaar\nMubarak ho aap sabko\nJanmashtami ka shubh tyohaar\nGOKUL ASHTAMI KI HARDIK SHUBHKAMNAYEN!",
    "Wo kala, Bansuri wala\nAisi raas rachaaye\nSubh-budh apni kho den gopiyan\nMurali aisi madhur bajaaye\nJanmdin hai aaj us natkhat ka\nKanha jise sab log bulaayen\nJanmashtami ki Shubhkaamnayen!",
    "Krishn kaho ya kaho Govinda\nYa kaho Banwaari\nGokul me jo kare niwas\nSab gopiyan jin par vaari\nDevki- Yashoda jinki maiyya\nWo hain mere Krishan Muraari\nShubh Janmashtami",
    "माखन चोर नन्द किशोर, बांधी जिसने प्रीत की डोर.\nहरे कृष्ण हरे मुरारी,पूजती जिन्हें दुनिया सारी,\nआओ उनके गुण गाएं सब मिल के जन्माष्टमी मनाये!!\nकृष्णा जन्माष्टमी की हार्दिक शुभकामनाये",
    "Saawan aaya, aayi barkha ki fuhaar\nSaath laaya kanhaiyya ka pyaar\nMubarak ho aap sabko\nJanmashtami ka ye Shubh tyohaar\nShubh Janmashtmi!",
    "Janmashtami ke shubh avsar par hum ye kaamna karte hain ki aap sab par Prabhu ki drishti sadaiv bani rahe!\nSukhon ki baarish ho aur ghar me\ndhan-dhaany bharaa rahe!\nJai Shree Krishan",
    "Aaj Janmashtami ke is paavan parv par us Prabhu se yahi prarthana hai ki wo sadaiv aapke saath rahen! Makhan aur mishri ke saath-saath aapke jeevan se saare dukh aur chintayen bhi le jaayen!\nKrishna Janmashtami ke tyohaar ki Badhayi!",
    "Aaj ke pavitr parv ki\nHamaare Krishna ke janmdin ki\nGokul ashtami ki\nAap sabko badhayi!\nIs Janmashtami Prabhu Shree Krishan aapko aur aapke parivaar ko samast khushiyan den!\nJai Shree Krishna!",
    "Aap sabko\nKrishna ashtami,\nGokul ashtami,\nAshtami Rohini,\nShree Krishn Jayanti,\nAur Shree Jayanti ki\nHardik Shubhkamnayen!",
    "Doodh-dahi churakar khaye\nMatkiyan wo tod giraye\nRooth kar Radha se jaaye\nHar pal uska jee dukhaye\nChhota sa Shyaam kamaal kare\nSabka beda paar kare\nShubh Janmashtami!",
    "Gokul me hai jinka waas,\nGopiyo sang jo karey raas,\nDevki-Yashoda jinki maiya,\naise hamare kishan kanhaiya.\nMay Lord Krishna fulfill all your wishes.\nHappy Janamasthami!",
    "Wo kala, Bansuri wala\nAisi raas rachaaye\nSubh-budh apni kho den gopiyan\nMurali aisi madhur bajaaye\nJanmdin hai aaj us natkhat ka\nKanha jise sab log bulaayen\nJanmashtami ki Shubhkaamnayen!",
    "Mor mukut makar aakriti kundal Aur bajanti mala\nBaso more nainan me nandlala. Happy Janamasthami",
    "Kabhi Apne Gaur Kiya hai?\nRADHE KRISHNA What Does it Mean?\nJust Think Speak These Words Very Slow\nRAAH-DE KRISHNA\nMeans Give Me Direction..!\nHappy Janamasthami..",
    "Gokul me ji kare niwas Gopiyo sang jo rachye raas,\nDevki-Yashda jinki maiya,\nAisehamare kishan kanhaiya\nJai shree krishna\nHappy janmashtami to all",
    "Hota hai pyar kya duniya ko jisne bataya,\nDil ke rishton ko jisne prem se sajaya,\nAaj us pyar ke dewta ka Birthday hai.\nHappy Janamasthami.",
    "Radha ki bhakti,\nmurli ki mithas,\nMakhan ka swaad aur gopiyo ka raas,\nSab milke banta hai janmastmi ka din khaas..\nHappy krishna Janamasthami!!",
    "Krishna jinka naam,\nGokul jinka dhaam,\nAise SHREE KRRISHN bhagwan ko,\nHum sab ka pranam,\nJANMAASTMI KI SHUB KAMNAYE Jai Shree Krrishna..\nHappy Janamasthami…!",
    "Sri Krishna ke kadam aap ke ghar aaye,\nAap khushiyon ke deep jalaye,\nPareshani aap se aankhe churaye,\nKrishna janmotsav ki apko shubkamnaye",
    "Prem se krishna ka naam japo\nDil ki har iccha poori hogi\nKrishna aaradhana mein talleen ho jaao\nUnki mahima, jeewan khushhaal kar degi.",
    "Radha ki chahat h krishna,\nUske dil ki virasat h krishna,\nChahe kitna bhi ras racha le krishna, Duniya to phir bhi yhi kehti h.",
    "Nand ke ghar Anand Hi Anand Bhayo,\nJo Nand Ke Ghar Gopal Aayo,\nJai Ho Murli Dhar Gopal ki,\nJai Ho Kanhaiya Lal Ki”\nHAPPY JANAMASHTMI",
    "Makhan chor Nandkishor.\nBandhi jisne preet ki dor!\nHarey krishan Harey murari,\npujti jinhe duniya sari.\nAao unke gunn gaye,\nSab mil k Janmasthmi mnae!",
    "Radhe ji ka prem\nMurli ki mithaas\nMakhan ka swaad\nGopiyoon ka raas\nInhii se milke ban ta he\nJanmashtami ka din khaas\nHappy janmashtami!",
    "Makhan churakr jisne khaya,\nBansi bajakr jisne nachaya,\nKhushi manao uske janm ki,\nJisne duniya ko Prem shikhaya.\nHAPPY JANMASHATMI",
    "Dekho Phir Janmashtmi Aayi Hai,\nMakhan Ki handi ne phir mithas bhadhai hai,\nKanha Ki leela hai Sabse Pyari,\nWo de tumhe duniya bhar k khusiya sari.\nHappy Janamashtami / Dahi Handi",
    "Kaanha Ke Kadmo Pe Kadam Badaate Chalo.\nAb Murli Nahi Toh Whistle Bajaate Chalo.\nRadha Toh Ghar Wale Dilaayenge Hi\nMagar Tab Tak Gopiya Pataate Chalo!\nHappy Janmashtami.",
    "Kanhaiya hamare dulare,\nWahi sabse pyare,\nMakhan ke liye jhagad jaye,\nGopiya dekhkar akrshit ho jaye,\nLekin sabke rakhwale,\nTabhi to sabhi ke dulare\nHappy Janmashtmi",
    "Nand ke ghar Anand Hi Anand Bhayo,\nJo Nand Ke Ghar Gopal Aayo,\nJai Ho Murli Dhar Gopal ki,\nJai Ho Kanhaiya Lal Ki”\nHappy Janmashtami.",
    "Krishan ki mahima, krishan ka pyar,\nKrishan me shradha, Krishan se sansar,\nMubarak ho apko Janmasthami ka tyohar..\nSHRI KRISHAN ki kripa aap par sada bani rahe..",
    "Unke guno se jivan ko sajaye,\nGITA ke vicharo ko man me basaye,\nLana hai hame KRISHNA ko aur bhi apne kareeb,\nTo aao apne ghar ko hi Gokul banaye..",
    "Janmashtami ke is shub avsar par.\nHum ye kaamna karty hai ki.\nShree Krishna ki kripa.\nAap pr, aur app ke pure\nparivar par Humesha bani rahe !.",
    "Krishna ke kadmo pe kadam badate chalo.\nAb murli nahi to citi bajate chalo.\nRadha to ghar wale dilayenge hi\nMagar tab tak gopiya patate chalo!",
    "Radha ki chahat h krishna, Uske dil ki virasat h krishna, Chahe kitna v ras racha le krishna, Duniya to phir v yhi kehti h. “RADHE KRISHNA”",
    "Ek Radha Ek Meera, Dono ne shyam ko chaaha, ab shyaam pe hai sara bhaar, kis ki preet kare sweekar.",
    "Mor mukut makar aakriti kundal Aur bajanti mala\nBaso more nainan me nandlala…।।।।।।।।",
    "Nand ke anand bhayo, Jai Kanhiya Lal Ki",
    "Mohan murali wala aaya\nRaas rachane wala aaya\nDeen dayaal daya kar mujh pe\nBhav saagar se paar kar mujhe\nGokul Ashtami sabke jeevan me khushiyan laaye!",
    "​On this Janmashtami\n​May Lord Krishna steal all your tensions and worries.\nAnd may Nand Gopal shower his blessings on you and your loved ones!\nHappy Janmashtami!",
    "May Lord Krishna come to your house and take all worries away along with him. May Lord bless you and your family.\nHappy Janmashtami!",
    "May Lord Krishna\nThe symbol of peace and love..\nFill up your life with joy and prosperity\nHappy Janmashtami",
    "Sending your way warm heartfelt wishes.\nMay you have a joyous occasion.\nHappy Janmashtami!",
    "The festival of Janmashtami not only awakens our soul but also enlightens our spirit and reminds us of the presence of Lord Krishna on Earth..",
    "May all your prayers be answered...\nAnd all your dreams come true...\nthis Janmashtami",
    "May Lord shower his blessings and love on you and family this Janmashtami.....\nJai Shri Krishna!",
    "May Murli Manohar continue showering health and happiness on your family and may you always remain in his list of favourites.\nHappy Janmashtami!!",
    "May the sound of flute of Nandlala invite melody in your life and you get blessed with a little natkhat like him.. God bless...\nHappy Janmashtami!!",
    "Celebrate the birth of Lord Krishna who enchants everyone by his playful mischiefs.\nHave a happy and blessed Krishna Janmashtami!",
    "May the Natkhat Nand Lala bless you and your family with peace and prosperity.\nWish you a Happy Krishna Janmashtami!",
    "May the Lord arrive at your house and take away all the pain and sorrow.\nWishing you and family a very Happy",
    "Let's celebrate the birth of Lord Krishna with full fervor and enthusiasm.\nHappy Janmashtami!",
    "May the lord drizzle his entire benediction over you and family.\nHave a happy and blessed Janmashtami!",
    "Let's celebrate Bhagwaan Krishna's Birth.\nSending you my heartfelt good wishes on this auspicious day of Janmashtami",
    "May lord krishna showers all his blessing on U.\nMay U get a lot of Happines in life..\nHappy janmashtami.",
    "May Lord Krishna always shower his blessings on you.\nAnd may every year Janmashtami bring lots of happiness for you and your family\nWishing you a very Happy Janmashtami",
    "On the auspicious birthday of Lord Krishna,\nMay the blessings of the Almighty bring joy, prosperity and happiness in your life.",
    "May Lord Krishna's grace always be with you.\nAnd may you get all that you ask for.\nHappy Janmashtami",
    "On this Janmashtami, may Bal Gopal free you from all your worries. Don’t forget to reach out to HIM for ultimate peace and happiness. Hare Krishna Hare Krishna, Krishna Krishna Hare Hare! Hare Rama Hare Rama, Rama Rama Hare Hare.",
    "Wishing that the makanchor fills your life with all the colours of happiness.\nSubh Janmashtami!",
    "Happy Krishna Janmashtami to you and your family. I wish nand lala takes away all your miseries and sorrows in the form of makhan(butter). May his blessings be with you and your family.",
    "Jai Kanhaiya Lal Ki. Jai Ho Murlidhar Gopal Ki. May this Janmashtami bring all the good luck and immense happiness to you and your family.",
    "Celebrate the birth of the ALMIGHTY! Spread the bliss of Janmashtami! Wishing you and your family a very happy and blessed Janmashtami.",
    "Jai Ho Murli Dhar Gopal ki,\nJai Ho Kanhaiya Lal Ki.\nJanmashtami Ke Pawan Avsar Par\naapko hardik shubhkaamnayein.",
    "​May the blessings of Lord Krishna beautify each moment of your life… this Janmashtami… and always!",
    "​May Lord Krishna bless you and your family with peace and happiness… Happy Krishna Janmashtami!",
    "​Sending your way warm heartfelt wishes… May you have a joyous occasion. Happy Janmashtami!",
    "​May the festival of Janmastami bring you joy, peace, and love. Happy Krishna Janmastami!",
    "​May Lord Krishna enrich your life with all his blessings. Happy Krishna Janmashtami!",
    "​Wishing you a Happy and Blessed Janmashtami. Jai Shri Krishna!",
    "नन्द के लाला को हमारा बार-बार नमस्कार।।\nश्री कृष्ण के कदम आपके घर आये,\nआप खुशियो के दीप जलाये,\nवृंदावन का रास रचइया, आ गया नन्द लाल कृष्ण कन्हैया..\nहैप्पी जन्माष्टमी",
    "Shree Krishan ke kadam aapke ghar aaye,\nAap khunshiyo ke deep jalaye,\nPareshani aapse ankhe churaye,\nKrishan janmotsav ki aapko shubhkamnaye.\nHappy Janmashtami",
    "Vrindavan ka raas rachaiya,\nAa gaya nand lal krishan kanhaiya...",
    "Aao Milkar Sajaaye Nandal Ko,\nAao Milkar Karein Gungaan Unka,\nJo Sabko Raah Dikhaate Hai Aur Sabki Bigdi Banate Hain\nSubh Janmashtami!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages List",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  MessageDetailPage(data[index], index)));

                      facebookAppEvents.logEvent(
                        name: "Message List",
                        parameters: {
                          'clicked_on_message_index': '$index',
                        },
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                ),
                                borderRadius:
                                    // 40 /8.98 = 4.46
                                    BorderRadius.all(Radius.circular(
                                        4.46 * SizeConfig.widthMultiplier))),
                            child: ListTile(
                              leading: Icon(Icons.brightness_1,
                                  color: Theme.of(context).iconTheme.color),
                              title: Text(
                                data[index],
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color:
                                      Theme.of(context).primaryIconTheme.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

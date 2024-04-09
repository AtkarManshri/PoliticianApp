
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:politician_app/pages/login.dart';
import 'socialwall.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//final currentUser=FirebaseAuth.instance.currentUser;


  List img = [
    "assets/images/InFocus.jpg",
    "assets/images/DonateForDesh.png",
    "assets/images/adv.jpg",
    "assets/images/adv2.jpg",
    "assets/images/nyay.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String? email = currentUser?.email;
    var mediaQuery=MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.lightBlueAccent, Colors.blue]),
          ),
        ),
        title: Text(
          "Home",
          style: const TextStyle(
            fontSize: 23.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange[400],
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Profile details'),
                content:  Text(email!),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pop(context, 'ok');
                        Navigator.pushNamed(context, "login");
                      });
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
            tooltip: 'Profile',
            iconSize: 36,
            icon: const Icon(Icons.account_circle_rounded),
            color: Colors.white,
            alignment: const Alignment(0, 8),
            padding: const EdgeInsets.only(top: 7, right: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Container(
                  height: 200.0,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Image.asset(
                        img[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: img.length,
                    itemWidth: 200.0,
                    itemHeight: 200.0,
                    layout: SwiperLayout.DEFAULT,
                    pagination: SwiperPagination(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13, 0, 13,0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.lightBlueAccent, Colors.blue]),
                           // color: Colors.indigo[700],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Achievement()),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Achievement \t',
                                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                  WidgetSpan(
                                    child: Icon(Icons.stars_sharp, size: 20, color: Colors.yellowAccent[700]),
                                  ),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            //color: Colors.indigo[600],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.lightBlueAccent, Colors.blue]),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Social()),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'SocialWall\t',
                                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                  WidgetSpan(
                                    child: Icon(Icons.handshake_outlined, size: 20, color: Colors.yellowAccent[700]),
                                  ),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: mediaQuery.size.height * 0.29,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: mediaQuery.size.height * 0.25,
                          width: mediaQuery.size.width*0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/history.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HistoryPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 250, bottom: 70),
                              child: Text(
                                '',
                               // style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              SizedBox(
                //height: mediaQuery.size.height * 0.5,
                //width:mediaQuery.size.width*0.5,

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment:Alignment.topCenter,
                          height: mediaQuery.size.height * 0.25,
                          width:mediaQuery.size.width*0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/policies.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PoliciesPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 250, bottom: 70),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}




class PoliciesPage extends StatefulWidget {
  @override
  State<PoliciesPage> createState() => _PoliciesPageState();
}

class _PoliciesPageState extends State<PoliciesPage> {
  List<String> years = [
    '60s',
    '70s',
    '80s',
    '90s',
    '2000s',
    '2010-2014s',
  ];

  List<String> policies = [
    "- Prevention of Cruelty to Animals Act, 1960 \n- Establishment of IITs, IIMs and AIIMS, 1961\n- Dowry Prohibition Act, 1961\n- The Atomic Energy Act, 1962\n- Official Languages Act, 1963\n- The Food Corporations Act, 1964\n- Payment of Bonus Act, 1965\n- Creation of separate states, 1966 (Punjab, Haryana, and Himachal Pradesh)\n- Green Revolution in India, 1967\n- National Education Policy, 1968\n- Registration of Births and Deaths Act, 1969\n",
    "-Operation Flood, 1970 (White Revolution) - world's largest dairy development program aimed at helping the dairy industry sustain itself economically while providing employment to poor farmers.\n-Abolition of Privy Purse, 1971 - Another step towards an egalitarian and just society\n-Creation of Bangladesh, 1971 - India supported the creation of a separate state for ethnic Bengalis who were being persecuted in erstwhile East Pakistan\n-Accelerated Rural water Supply Programme, 1972-73 - To increase coverage of drinking water supply across the country\nCentral Council of Homeopathy was set up, 1973\nFirst Nuclear Test at Pokhran, 1974 – India became a nuclear power\nTwenty Point Programme, 1975 - To eradicate poverty and improve the quality of life of the underprivileged\n-National Informatics Centre, 1976 - Set up as a promoter of digital opportunities for sustainable development\n-Water (Prevention and Control of Pollution) Act 1974 – provide for the prevention and control of water pollution, and for the maintaining or restoring of wholesomeness of water in the country\n-Press Council Act, 1978 - To preserve freedom of Press and maintain standards of news agencies\n-Interstate Migrant Workmen Act, 1979 - To regulate the condition of service of inter-state labourers",
    "-Integrated Rural Development Programme, 1977-78 - To enable identified rural poor families to cross the poverty line\n-Air (Prevention and Control of Pollution) Act, 1981 - To provide for the prevention, control and abatement of air pollution\n-Anti-Hijacking Act, 1982 - To give effect to the Convention for the Suppression of Unlawful Seizure of Aircraft\n-Rural Landless Employment Guarantee Programme, 1983 - To provide guaranteed employment to at least one member of every landless household up to 100 days in a year\nThe Integrated Guided Missile Development Programme (IGMDP), 1983 - Conceived by Dr. APJ Abdul Kalam to help India attain self-sufficiency in missile technology\n-The Family Courts Act, 1984 - to secure speedy settlement of disputes relating to marriage and family affairs\n-Creation of Centre for Development of Telematics (C-DOT), 1984: Triggered a telecom revolution in rural India\n-Comprehensive Crop Insurance Scheme, 1985 - To provide security to farmers during crop loss due to natural disasters\n-Anti-Defection Law, 1985 - Provisions for disqualification of elected members on the grounds of defection to another party\n-National Drinking Water Mission, 1986 - To ensure the provision of adequate drinking water supply to the rural community with stress on water quality and technology intervention\n-Mizoram Accord of June, 1986 - To end insurgency and violence and restore peace in Mizoram\n-Consumer Protection Act, 1986 - To provide better protection of consumers' interests\n-National Policy on Child Labour 1987 – An action plan for tackling the problem of Child Labour\n-Prevention of Corruption Act, 1988 - to combat corruption in govt agencies and public sector enterprises\n-The Scheduled Castes and Tribes (Prevention of Atrocities",
    "- Economic Liberalization, 1991 - Indian economy opened up\n-Consumer Protection Act, 1986 - To provide better protection of consumers' interests\n-Look East Policy, 1991: To develop economic and strategic relations with the Southeast Asian nations\n-New Industrial Policy, 1991 - To raise industrial efficiency to international level\n-Introduction of Panchayati Raj, 1992 - A major push towards strengthening local self-government and promote the development of, and regulate the securities market\n-Securities and Exchange Board of India Act, 1992 - To protect the interests of investors in securities\n-Member of Parliament Local Area Development (MPLAD) scheme, 1993 - To develop the constituencies in various sectors like health, education, drinking water etc.\n-Mahila Samridhi Yojana, 1993 - To provide economic security and financial inclusion of rural women\n-Pre-Conception and Pre-Natal Diagnostic Techniques Act, 1994 - To stop female foeticides and arrest declining sex ratio\n-Mid-Day Meal Scheme, 1995 - To improve nutritional levels among children and to enhance their enrolment and attendance in schools\n-National Social Assistance Programme, 1995 - To provide social assistance benefits to poor households for the aged, widows, disabled and in the case of death of the breadwinner",
    "-National Food for Work Programme, 2004 - To generate supplementary wage employment and provide food security\n-Kasturba Gandhi Balika Vidyalaya, 2004 - To set up residential upper primary schools for girls belonging predominantly to SC, ST, OBC and minority communities\n-National Rural Health Mission, 2005 - To provide equitable, affordable and quality healthcare to rural population\n-Janani Suraksha Yojana, 2005 - To reduce neonatal and maternal deaths by promoting institutional delivery amongst poor women\n-Bharat Nirman, 2005 - A plan for rural infrastructure in the areas of irrigation, housing, water supply, electrification and telecommunication connectivity\n-Rajiv Gandhi Grameen Vidyutikaran Yojana, 2005 - To electrify rural households and provide connections free of charge to BPL households\n-Jawaharlal Nehru National Urban Renewal Mission, 2005 - To improve quality of life and infrastructure in cities\n-Right to Information Act, 2005 - To promote transparency and accountability in the working of every public authority\n-The Protection Of Women From Domestic Violence Act, 2005 - To provide protection for women from domestic violence\n-Special Economic Zones (SEZ) Act , 2005 - To provide for the establishment, development and management of SEZs for the promotion of exports\n-Rajiv Gandhi National Fellowship (RGNF), 2005-06 - To give those candidates from the deprived sections an opportunity to undertake advanced studies and research\n-National Rural Employment Guarantee Scheme, 2005 - To provide 100 days of guaranteed wage employment in a year to adult members of every household\n-National Environment Policy, 2006 - A statement of India's commitment to a clean environment\n-Prohibition of Child Marriage Act, 2006- To overcome constraints of the former acts in dealing with the problem of child marriage\n-Rastriya Swasthya Bima Yojana, 2007 - To provide financial protection against catastrophic health costs for vulnerable sections\n-Rashtriya Krishi Vikas Yojana, 2007 - To reorient agricultural development strategies to meet the needs of farmers\n-National Investigation Agency (NIA) established, 2008 - To combat terrorism\n-Indo-US Nuclear Deal, 2008 - India and the US agreed ",
    "-National Green Tribunal Act, 2010 - National Green Tribunal was established\n-The Whistle Blowers Protection Act, 2011 - To eliminate corruption in bureaucracy and protect those who make complaints against public servants\n-Public Procurement Policy for Micro and Small Enterprises (MSEs) Order, 2012 - To promote MSEs by supporting them in marketing\n-National Food Security Act, 2013 - To provide food and nutritional security to all\n-Nirbhaya Act, 2013 - A stricter law to deal with sex crimes against women\n-The Sexual Harassment of Women at Workplace (Prevention, Prohibition and Redressal) Act, 2013 - To provide protection against sexual harassment of women at workplace\n-Lokpal and Lokayukta Act, 2013 - To provide for the establishment of Lokpal and Lokayukta to inquire into allegations of corruption against certain public functionaries\n-National Mission for Empowerment of Women (NMEW), 2010 -To facilitate coordination of women’s welfare and socio-economic development programmes across ministries\n-Land Acquisition Act, 2013 - To regulate land acquisition and lay down procedure for granting compensation, rehabilitation and resettlement to the affected persons\n-Companies Act, 2013 - Corporate Social Responsibility (CSR) was made mandatory\n-Street Vendors Act, 2014 - To regulate street vendors in public areas and protect their rights\n",
  ];

  List<bool> _isExpandedList = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {



    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Policies'),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile( splashColor: Colors.lightBlueAccent,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(150, 8, 20, 8),
                  child: Text(
                    years[index],
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                tileColor: Colors.white,
                onTap: () {
                  setState(() {
                    tileColor: Colors.blueGrey;
                    _isExpandedList[index] = !_isExpandedList[index];
                  });
                },
              ),
              SizedBox(height: mediaQuery.height*0.01,),
              if (_isExpandedList[index])
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    policies[index],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}







class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);
  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  late Future<void> _videosLoadedFuture;

  @override
  void initState() {
    super.initState();
    _videosLoadedFuture = _loadVideos();
  }
  Future<void> _loadVideos() async {
    // Simulate loading delay
    await Future.delayed(Duration(seconds: 2));
  }
  List<String> videoIds = [
"tqvJpVxmZ4s"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Achievements",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder<void>(
        future: _videosLoadedFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while videos are loading
            return Center(
                child:SpinKitWanderingCubes(
                  color: Colors.blue,
                )
            );
          } else {
            // Once videos are loaded, display them
            return ListView.builder(
              itemCount: videoIds.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(15),
                  elevation: 5.0,
                  shadowColor: Colors.indigo[200],
                  surfaceTintColor: Colors.lightBlueAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children:
                    [ SizedBox(
                      height: 20,
                      width: 20,
                    )
                      ,
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {},
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: videoIds[index],
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      )
                      ,
                      Text("India at 70: ", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Take a look at India's Key Achievements during 60 Years of Congress Rule | 1947- 2014",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          ),
                      SizedBox(width: 20,
                      height: 20,)
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brief History:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The Indian National Congress (INC) is one of the oldest and largest political parties in India. It was founded in 1885 during British colonial rule as a platform for Indian nationalist leaders to demand independence and self-rule for India...',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Key Milestones:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildMilestone('1885', 'Foundation of Indian National Congress'),
            _buildMilestone('1947', 'India gains independence; INC forms government'),
            _buildMilestone('1950', 'Adoption of the Indian Constitution'),
            _buildMilestone('1966', 'Indira Gandhi becomes Prime Minister'),
            _buildMilestone('1991', 'Economic liberalization reforms initiated'),
            _buildMilestone('2014', 'Narendra Modi becomes Prime Minister'),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestone(String year, String event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          year,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          event,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
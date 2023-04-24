import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your appljkkjolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWid(),
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2.0
              )
            ),
            height: 40.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.0,vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(onPressed: (){
                    _scaffoldKey.currentState?.openDrawer();
                  },
                   icon: Icon(Icons.menu,
                     color: Colors.black),
                  ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SearchPage();
                    }));
                  },
                  child: Text("search ,numbers & more",
                  overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
                  PopupMenuButton(
                      itemBuilder: (context)=>[
                        PopupMenuItem(child: ListTile(leading: Icon(Icons.auto_delete_outlined),
                        title: Text('Inbox Cleaner'),)),
                        PopupMenuItem(child: ListTile(leading: FaIcon(FontAwesomeIcons.sms),
                          title: Text('Change Default SMS app'),)),
                        PopupMenuItem(child: ListTile(leading: Icon(Icons.mark_chat_read_outlined),
                          title: Text('Mark All As Read'),)),
                        PopupMenuItem(child: ListTile(leading: Icon(Icons.archive_outlined),
                          title: Text('Archived Conversations'),)),
                        PopupMenuItem(child: ListTile(leading: Icon(Icons.settings_outlined),
                          title: Text('Settings'),)),
                      ],
                    child: Icon(Icons.more_vert,
                    color: Colors.grey,),
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerWid extends StatelessWidget {
  const DrawerWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Anmol',
                style: TextStyle(
                color: Colors.black,
                fontSize: 18.0
              ),),
              accountEmail: Text('mxxxxxx94@gmail.com',
                style: TextStyle(
                    color: Colors.black38,
                ),),
            otherAccountsPictures: <Widget>[
              Transform.translate(
                offset: Offset(0,82),
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors.grey.shade400,
                  child: CircleAvatar(radius: 23.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit_outlined,color: Colors.grey,size: 22.0,),
                  ),
                ),
              )
            ],
            margin: EdgeInsets.only(top: 16.0,left: 8.0),
            decoration: BoxDecoration(
              color: Colors.white24
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: Icon(Icons.add_a_photo_outlined,
              color: Colors.blue.shade100,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width:1.0,color: Colors.grey.shade400)
              ),
                child:ListTile(
              leading: FaIcon(FontAwesomeIcons.crown,color: Colors.yellowAccent,),
              title: Transform.translate(offset:Offset(-16,0),child: Text('Upgrade to Premium')),
            )),
          ),
          DrawerTile(
              icon: Icon(Icons.coronavirus_outlined),
              title: 'Covid Relief',
              trailing: 'NEW'),
          DrawerTile(
              icon: Icon(Icons.auto_delete_outlined),
              title: 'Inbox Cleaner',
              trailing: 'NEW'),
          DrawerTile(
              icon: Icon(Icons.remove_red_eye_outlined),
              title: 'Who viewed my profile',
              trailing: '1'),
          DrawerTile(
              icon: Icon(Icons.qr_code_scanner_outlined),
              title: 'QR Scanner',
             ),
          DrawerTile(
              icon: CircleAvatar(
                  radius: 12.0,
                  backgroundColor: Colors.grey.shade800,
                  child: FaIcon(FontAwesomeIcons.indianRupeeSign
              ,color: Colors.white,size: 14.0,)),
              title: 'Personal Loans'),
          DrawerTile(
            icon: Icon(Icons.notifications_outlined),
            title: 'Notifications',
            trailing: '1',
          ),
          DrawerTile(
            icon: Icon(Icons.shield_outlined),
            title: 'Manage Blocking',
          ),
          DrawerTile(
            icon: FaIcon(FontAwesomeIcons.lifeRing),
            title: 'Personal Safety',
            trailing: 'NEW',
          ),
          DrawerTile(
            icon: FaIcon(FontAwesomeIcons.solidHeart,color: Colors.blue,),
            title: 'Truecaller News',
          ),
          DrawerTile(
            icon: Icon(Icons.card_giftcard_outlined),
            title: 'Invite Friends',
          ),
          Divider(thickness: 1,color: Colors.grey.shade300,),
          ListTile(
            title: Transform.translate(offset:Offset(8,0),child: Text('Dark Mode')),
            trailing: CircleAvatar(
              radius: 18.0,
              backgroundColor: Colors.grey.shade300,
              child: CircleAvatar(
                  radius:16.0,
                  backgroundColor: Colors.white,
                  child: FaIcon(FontAwesomeIcons.moon,color: Colors.grey.shade800,size: 16.0,)),
            ),
          ),
          OtherOptions(title: 'Settings'),
          OtherOptions(title: 'Send feedbacks'),
          OtherOptions(title: 'FAQ'),
        ],
      )
      );
  }
}

class OtherOptions extends StatelessWidget {
  const OtherOptions({
    Key?key,required this.title
  }):super(key:key);
  final title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Transform.translate(offset: Offset(8,0),child: Text(title),),
    );
  }
}

class DrawerTile extends StatefulWidget {
  const DrawerTile({
    Key? key,this.trailing,required this.title,required this.icon
  }):super(key:key);
  final trailing;
  final title;
  final icon;

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) { Widget trailText= widget.trailing == null?CircleAvatar(
    radius: 0,
    backgroundColor: Colors.transparent,
  ):CircleAvatar(radius: 10.0,backgroundColor: Colors.blue,
    child: Text(widget.trailing,
      style: TextStyle(
        fontSize: 6.0,fontWeight: FontWeight.w600
      ),),);
    return ListTile(
      leading: Transform.translate(
          offset:Offset(-8,0),child: widget.icon),
      title: Transform.translate(
          offset: Offset(-8,0),child:Text(widget.title.toString())),
      trailing: trailText,
          );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2.0
                )
            ),
            height: 40.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.0,vertical: 2.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      icon: Icon(Icons.arrow_back,
                          color: Colors.black),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400
                            )
                          ),
                        )
                      ),
                    ),
                    IconButton(onPressed: (){},
                      icon: Icon(Icons.image_search_outlined,
                          color: Colors.grey),
                    ),
                    IconButton(onPressed: (){},
                      icon: Icon(Icons.location_on_outlined,
                          color: Colors.grey),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}


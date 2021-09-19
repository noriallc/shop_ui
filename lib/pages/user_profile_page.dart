import 'package:flutter/material.dart';
import 'package:shop_ui/components/list_tile.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_ui/models/list_tile.dart';
import 'package:shop_ui/route.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';

class UserProfilePage extends StatefulWidget {
  static const routeName = '/user_profile_page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserProfilePageState();
  }
}

class UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int cartCount = 2;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.tertiaryColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 320,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Stack(children: [
                                    _topAvatar(),
                                    _userPhoto(),
                                  ]),
                                ),
                              ],
                            ),
                            _userName(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _list(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 3, cartCount: 0),
    );
  }

  Widget _userPhoto() {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsets.only(top: 120),
        child: Container(
          width: 150,
          height: 150,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            foregroundImage: NetworkImage(
              'https://i.imgur.com/M0xax1O.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _userName() {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Name Surname',
            style: AppTheme.title3.override(
              fontFamily: 'Poppins',
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _list() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ...listTile.map((e) => ListTileWidget(
                title: e.title,
                onTap: () {},
                topRadius: 5,
                bottomRadius: 5,
              )),
        ],
      ),
    );
  }

  Widget _topAvatar() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
            child: Image.network(
              "https://i.imgur.com/FRaruxF.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment(-1, 0),
                    child: GestureDetector(
                      onTap: () {
                        goBack(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppTheme.tertiaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment(-1, 0),
                    child: Icon(
                      FontAwesomeIcons.ellipsisH,
                      color: AppTheme.tertiaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

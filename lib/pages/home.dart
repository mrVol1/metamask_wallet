import 'package:flutter/material.dart';
import 'package:metamask_app/consts/colors.dart';
import 'package:metamask_app/pages/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Assets'),
    Tab(text: 'History'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsConst.colorTextMedium,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buttonAccount(),
                          const SizedBox(
                            width: 16.0,
                          ),
                          _accountInfo(),
                          const SizedBox(
                            width: 72.0,
                          ),
                          _networkButton(),
                          const SizedBox(
                            width: 8.0,
                          ),
                          _menuButton(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '\$404.18 USD',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF_Regular',
                            fontSize: 32.0),
                      ),
                      Text(
                        '1.0285 ETH',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF_Medium',
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 43.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: ColorsConst.colorIndicator,
                    tabs: myTabs,
                  ),
                ),
                Container(
                  color: ColorsConst.colorTheme,
                  width: 375.0,
                  height: 600.0,
                  child: TabBarView(
                    controller: _tabController,
                    children: myTabs.map((Tab tab) {
                      return Column(
                        children: [
                          _cryproCoin1(),
                          const Divider(),
                          _cryproCoin2(),
                          const Divider(),
                          _cryproCoin3(),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 148.0,
            height: 40.0,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: ColorsConst.colorTextMedium),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Deposit',
                style: TextStyle(
                  fontFamily: 'SF_Medium',
                  color: ColorsConst.colorTextMedium,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          SizedBox(
            width: 148.0,
            height: 40.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(375, 80),
                primary: ColorsConst.colorTextBold,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Transfer',
                style: TextStyle(
                  fontFamily: 'SF_Medium',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonAccount() {
    return InkWell(
      onTap: () {
        Route route =
            MaterialPageRoute(builder: (context) => const UserScreen());
        Navigator.push(context, route);
      },
      child: Image.asset(
        'assets/images/account_connected.png',
        width: 32.0,
        height: 32.0,
      ),
    );
  }

  Widget _accountInfo() {
    return SizedBox(
      width: 128.0,
      child: TextButton(
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Daily Driver',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'SF_Regular'),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              '0x3Cd…bF32x',
              style: TextStyle(
                  color: Colors.white, fontSize: 12.0, fontFamily: 'SF_Medium'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _networkButton() {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        'assets/images/network_select_white.png',
        width: 32.0,
        height: 32.0,
      ),
    );
  }

  Widget _menuButton() {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        'assets/images/hamburger.png',
        width: 32.0,
        height: 32.0,
      ),
    );
  }

  Widget _cryproCoin1() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(375, 80),
          primary: ColorsConst.colorTheme,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(
              'assets/images/DATA_icon.png',
              width: 32.0,
              height: 32.0,
            ),
            const SizedBox(
              width: 2.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '616.875 DATA',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'SF_Medium',
                      color: ColorsConst.colorTextMedium),
                ),
                const Text(
                  '\$30.85',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'SF_Medium',
                      color: Color(0xFF807DC0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cryproCoin2() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(375, 80),
          primary: ColorsConst.colorTheme,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(
              'assets/images/ETH_icon.png',
              width: 32.0,
              height: 32.0,
            ),
            const SizedBox(
              width: 2.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '0.95 ETH',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'SF_Medium',
                      color: ColorsConst.colorTextMedium),
                ),
                const Text(
                  '\$373.33',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'SF_Medium',
                      color: Color(0xFF807DC0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cryproCoin3() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(375, 80),
          primary: ColorsConst.colorTheme,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(
              'assets/images/add_token.png',
              width: 32.0,
              height: 32.0,
            ),
            const SizedBox(
              width: 2.0,
            ),
            Text(
              'Add token',
              style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'SF_Medium',
                  color: ColorsConst.colorTextBold),
            ),
          ],
        ),
      ),
    );
  }
}

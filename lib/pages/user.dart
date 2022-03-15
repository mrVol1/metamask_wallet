import 'package:flutter/material.dart';
import 'package:metamask_app/consts/colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Accounts'),
    Tab(text: 'Connections'),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsConst.colorTextMedium,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/account_connected.png',
            width: 32.0,
            height: 32.0,
          ),
        ),
        centerTitle: false,
        title: TextButton(
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
                    color: Colors.white,
                    fontSize: 12.0,
                    fontFamily: 'SF_Medium'),
              ),
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/network_select_white_opasity.png',
            width: 32.0,
            height: 32.0,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/x_close_grey.png',
              width: 32.0,
              height: 32.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _selectNetwork(),
          const SizedBox(
            height: 27.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: ColorsConst.colorIndicator,
              labelColor: ColorsConst.colorTextMedium,
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
    );
  }

  Widget _selectNetwork() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 24.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/DATA_icon.png',
                width: 32.0,
                height: 32.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Streamr.network',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF_Medium',
                        color: ColorsConst.colorTextBold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Can view addresses',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'SF_Medium',
                          color: ColorsConst.colorBlutLight),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/acc_connected.png',
                  width: 32.0,
                  height: 32.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Driver',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'SF_Medium',
                          color: ColorsConst.colorTextMedium),
                    ),
                    const Text(
                      '\$404.18',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'SF_Medium',
                          color: Color(0xFF807DC0)),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              'assets/images/selected_tick.png',
              width: 32.0,
              height: 32.0,
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
}

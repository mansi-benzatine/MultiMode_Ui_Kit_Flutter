import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/ui/market/view/market_screen.dart';
import 'package:bitx_screens_app/ui/profile/view/profile_screen.dart';
import 'package:bitx_screens_app/ui/wallet/view/wallet_screen.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/sizer_utils.dart';
import '../../exchange_stock/view/exchange_stock_screen.dart';
import '../data_model/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final String selectedMarketTab;
  final bool forEmptyMarket;
  final bool forDeleteAccountDialog;
  final bool forLogoutDialog;

  const DashboardScreen({
    super.key,
    this.currentIndex = 0,
    this.selectedMarketTab = "",
    this.forEmptyMarket = false,
    this.forDeleteAccountDialog = false,
    this.forLogoutDialog = false,
  });

  static Route<void> route({
    int currentIndex = 0,
    String selectedMarketTab = "",
    bool forEmptyMarket = false,
    bool forDeleteAccountDialog = false,
    bool forLogoutDialog = false,
  }) {
    return MaterialPageRoute(
      builder: (context) => DashboardScreen(
        currentIndex: currentIndex,
        selectedMarketTab: selectedMarketTab,
        forEmptyMarket: forEmptyMarket,
        forDeleteAccountDialog: forDeleteAccountDialog,
        forLogoutDialog: forLogoutDialog,
      ),
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  List<BottomNavItem> _navItems = [];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;

    _navItems = [
      BottomNavItem(
        selectedIcon: AppAssets.icBottomHomeSelected,
        unselectedIcon: AppAssets.icBottomHome,
        screen: const HomeScreen(),
        screenName: "Home",
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icBottomMarketSelected,
        unselectedIcon: AppAssets.icBottomMarket,
        screen: MarketScreen(
          selectedTab: widget.selectedMarketTab,
          forEmptyScreen: widget.forEmptyMarket,
        ),
        screenName: "Market",
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icBottomSwap,
        unselectedIcon: AppAssets.icBottomSwap,
        screen: const ExchangeStockScreen(),
        screenName: "",
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icBottomWalletSelected,
        unselectedIcon: AppAssets.icBottomWallet,
        screen: const WalletScreen(),
        screenName: "Wallet",
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icBottomProfileSelected,
        unselectedIcon: AppAssets.icBottomProfile,
        screen: ProfileScreen(
          forLogoutDialog: widget.forLogoutDialog,
          forDeleteAccountDialog: widget.forDeleteAccountDialog,
        ),
        screenName: "Profile",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _navItems[currentIndex].screen,
            CustomPaint(
              size: Size(0.screenWidth, 110),
              painter: RPSCustomPainter(color: CustomAppColor.of(context).bottomNavbar),
              child: Container(
                height: 92.setHeight,
                padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 0.setHeight),
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildIcon(0),
                    _buildIcon(1),
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03, right: 3.setWidth),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCFD7FB),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CustomAppColor.of(context).transparent,
                              width: 8.setWidth,
                            ),
                          ),
                          child: Image.asset(
                            currentIndex == 2 ? AppAssets.icBottomSwap : AppAssets.icBottomSwap,
                            width: 20.setWidth,
                            height: 20.setHeight,
                          ),
                        ),
                      ),
                    ),
                    _buildIcon(3),
                    _buildIcon(4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    final isSelected = currentIndex == index;
    final iconPath = isSelected ? _navItems[index].selectedIcon : _navItems[index].unselectedIcon;

    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              iconPath,
              height: 20.setHeight,
              width: 20.setWidth,
              color: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).unselectedBottomBarIcon,
            ),
            SizedBox(height: 6.setHeight),
            CommonText(
              text: _navItems[index].screenName,
              textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).unselectedBottomBarIcon,
              fontWeight: FontWeight.w500,
              fontSize: 11.setFontSize,
            ),
            SizedBox(height: 15.setHeight),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  Color color;

  RPSCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9750748, size.height * 0.3372782);
    path_0.cubicTo(size.width * 0.9892664, size.height * 0.3434455, size.width, size.height * 0.3901327, size.width, size.height * 0.4456945);
    path_0.lineTo(size.width, size.height * 0.9909000);
    path_0.cubicTo(size.width, size.height * 0.9959182, size.width * 0.9989533, size.height * 0.9999909, size.width * 0.9976636, size.height * 0.9999909);
    path_0.lineTo(size.width * 0.002336449, size.height * 0.9999909);
    path_0.cubicTo(size.width * 0.001046063, size.height * 0.9999909, 0, size.height * 0.9959182, 0, size.height * 0.9909000);
    path_0.lineTo(0, size.height * 0.4456945);
    path_0.cubicTo(size.width * 4.222360e-7, size.height * 0.3901327, size.width * 0.01073341, size.height * 0.3434455, size.width * 0.02492523, size.height * 0.3372782);
    path_0.lineTo(size.width * 0.3785210, size.height * 0.1836136);
    path_0.cubicTo(size.width * 0.3993084, size.height * 0.1745800, size.width * 0.4158879, size.height * 0.2641782, size.width * 0.4158879, size.height * 0.3455609);
    path_0.cubicTo(size.width * 0.4158879, size.height * 0.5488691, size.width * 0.4535467, size.height * 0.7136809, size.width * 0.5000000, size.height * 0.7136809);
    path_0.cubicTo(size.width * 0.5464533, size.height * 0.7136809, size.width * 0.5841121, size.height * 0.5488691, size.width * 0.5841121, size.height * 0.3455609);
    path_0.cubicTo(size.width * 0.5841121, size.height * 0.2641773, size.width * 0.6006916, size.height * 0.1745800, size.width * 0.6214766, size.height * 0.1836136);
    path_0.lineTo(size.width * 0.9750748, size.height * 0.3372782);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

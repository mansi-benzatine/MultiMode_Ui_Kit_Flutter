import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../app/my_app.dart';
import '../../home_screen/datamodel/home_screen_data.dart';

List<CategoryList> recentlyViewedList = [
  CategoryList(
    imagePath: AppAssets.imgWomenTop,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).womenTop,
    discount: 70,
  ),
  CategoryList(
    imagePath: AppAssets.imgKurti,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).kurti,
    discount: 50,
  ),
];

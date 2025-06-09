import 'package:flutter/material.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../utils/app_color.dart';
import '../../../../../../../utils/sizer_utils.dart';
import '../../../../../../../widgets/button/common_button.dart';
import '../../../../../../../widgets/text/common_text.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../utils/string_constant.dart';
import '../../search/view/search_screen.dart';
import '../datamodel/followers_data.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FollowersScreen(),
    );
  }

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> with TickerProviderStateMixin {
  bool? isSuggestedTab;
  late TabController _tabController;
  List<String> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index == 2 && !_tabController.indexIsChanging) {
        setState(() {
          isSuggestedTab = true;
        });
      } else {
        setState(() {
          isSuggestedTab = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).followers,
      Languages.of(context).following,
      Languages.of(context).suggested,
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          title: CommonText(
            text: AppStrings.elizaWoods.toLowerCase(),
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
              child: IconButton(
                onPressed: () => Navigator.push(context, SearchScreen.route()),
                icon: Image.asset(
                  AppAssets.icSearchFilled,
                  color: CustomAppColor.of(context).icBlack,
                  scale: 4.2,
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(15)),
          child: Column(
            children: [
              tabBar(context),
              Expanded(child: suggestedFollowersList(context)),
            ],
          ),
        ),
      ),
    );
  }

  tabBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
      child: TabBar(
        controller: _tabController,
        tabAlignment: TabAlignment.center,
        labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
        isScrollable: true,
        unselectedLabelColor: AppColor.txtGrey,
        labelStyle: TextStyle(
          fontFamily: Constant.fontFamilyUrbanist,
          fontSize: AppSizes.setFontSize(16),
          fontWeight: FontWeight.w600,
        ),
        labelColor: AppColor.txtPurple,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
          insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(95)),
        ),
        tabs: tabList.map((tab) {
          return Tab(
            text: tab,
          );
        }).toList(),
      ),
    );
  }

  suggestedFollowersList(BuildContext context) {
    final followers = isSuggestedTab ?? false ? getFollowers : getSuggestedFollowers;

    return ListView.builder(
      itemCount: followers.length,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, index) {
        final follower = followers[index];
        return ListTile(
          isThreeLine: false,
          minVerticalPadding: 16,
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(follower.followerProfile),
            radius: 26,
          ),
          title: CommonText(
            text: follower.followerName,
            fontSize: AppSizes.setFontSize(15),
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          subtitle: SizedBox(
            width: double.infinity,
            child: CommonText(
              text: follower.followerDetails ?? '',
              fontSize: AppSizes.setFontSize(12),
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonButton(
                isOutLinedButton: follower.isFollowing ?? false,
                width: AppSizes.setWidth(74),
                height: AppSizes.setHeight(30),
                onTap: () {
                  setState(() {
                    follower.isFollowing = !(follower.isFollowing ?? false);
                  });
                },
                child: CommonText(
                  text: follower.isFollowing ?? false ? Languages.of(context).following : Languages.of(context).follow,
                  fontSize: AppSizes.setFontSize(12),
                  fontWeight: FontWeight.w700,
                  textColor: follower.isFollowing ?? false ? AppColor.txtPurple : AppColor.txtWhite,
                ),
              ),
              Visibility(
                visible: isSuggestedTab ?? false,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    color: AppColor.btnGradiant2,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

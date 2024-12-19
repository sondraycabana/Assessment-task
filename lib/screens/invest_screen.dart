import 'package:accessment_task/constants/app_colors.dart';
import 'package:accessment_task/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import '../constants/app_texts.dart';
import '../widgets/investment_card.dart';
import 'invest_details_screen.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({Key? key}) : super(key: key);

  @override
  _InvestScreenState createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isTyping = false;

  @override
  void initState() {
    super.initState();

    // Listen to changes in the text field
    _searchController.addListener(() {
      setState(() {
        _isTyping = _searchController.text.isNotEmpty;
      });
    });

    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final investments = [
      {
        "imageUrl": AssetPath.logo1,
        "subtitle": "20%",
        "subtitle2": "Returns in 9 months",
        "title": "Propertyvest Estate",
        "amount": "₦5,000",
        "unit": "Per unit",
        "status": "Still selling"
      },
      {
        "imageUrl": AssetPath.logo3,
        "subtitle": "30%",
        "subtitle2": "Returns in 9 months",
        "title": "Cashew Nut Fund",
        "amount": "₦10,000",
        "unit": "Per unit",
        "status": "Sold out"
      },
      {
        "imageUrl": AssetPath.logo1,
        "subtitle": "20%",
        "subtitle2": "Returns in 9 months",
        "title": "Propertyvest Estate",
        "amount": "₦5,000",
        "unit": "Per unit",
        "status": "Still selling"
      },
      {
        "imageUrl": AssetPath.logo3,
        "subtitle": "30%",
        "subtitle2": "Returns in 9 months",
        "title": "Cashew Nut Fund",
        "amount": "₦10,000",
        "unit": "Per unit",
        "status": "Sold out"
      },
      {
        "imageUrl": AssetPath.logo2,
        "subtitle": "20%",
        "subtitle2": "Returns in 9 months",
        "title": "Propertyvest Estate",
        "amount": "₦5,000",
        "unit": "Per unit",
        "status": "Still selling"
      },
      {
        "imageUrl": AssetPath.logo2,
        "subtitle": "30%",
        "subtitle2": "Returns in 9 months",
        "title": "Cashew Nut Fund",
        "amount": "₦10,000",
        "unit": "Per unit",
        "status": "Sold out"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Text(
              AppTexts.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: AppColors.text1Color,
                fontFamily: "Karla",
              ),
            ),
            const SizedBox(height: 5),
            RichText(
              text: const TextSpan(
                text: AppTexts.subTitle1,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: AppColors.text1Color,
                  fontFamily: "Karla",
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppTexts.subTitle2,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Karla",
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: _isTyping
                    ? Colors.lightBlue.shade50
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _focusNode.hasFocus
                      ? Colors.blue
                      : Colors.grey.shade400,
                ),
              ),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: 'Search for investments...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 8,
              children: [
                Chip(
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: AppColors.borderColor,
                        width: 1.0),
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)),
                  ),
                  label: Text(
                    AppTexts.product1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Karla",
                      fontWeight: FontWeight.w400,
                      color: AppColors.text1Color,
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  label: Text(
                    AppTexts.product2,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Karla",
                      fontWeight: FontWeight.w400,
                      color: AppColors.text1Color,
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  label: Text(
                    AppTexts.product3,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Karla",
                      fontWeight: FontWeight.w400,
                      color: AppColors.text1Color,
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  label: Text(
                    AppTexts.product4,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Karla",
                      fontWeight: FontWeight.w400,
                      color: AppColors.text1Color,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 30.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: investments.length,
                itemBuilder: (context, index) {
                  final investment = investments[index];
                  return InvestmentCard(
                    imageUrl: investment["imageUrl"] as String,
                    subtitle: investment["subtitle"] as String,
                    subtitle2: investment["subtitle2"] as String,
                    title: investment["title"] as String,
                    amount: investment["amount"] as String,
                    unit: investment["unit"] as String,
                    status: investment["status"] as String,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvestDetailsScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.bottomIcon1,
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.bottomIcon2,
              width: 24,
              height: 24,
            ),
            label: "Invest",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.bottomIcon3,
              width: 24,
              height: 24,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.bottomIcon4,
              width: 24,
              height: 24,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.bottomIcon5,
              width: 24,
              height: 24,
            ),
            label: "Settings",
          ),
        ],
        selectedItemColor: AppColors.colorBlue,
        unselectedItemColor: AppColors.colorGrey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


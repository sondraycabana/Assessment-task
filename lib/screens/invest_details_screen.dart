import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/asset_paths.dart';

class InvestDetailsScreen extends StatefulWidget {
  const InvestDetailsScreen({Key? key}) : super(key: key);

  @override
  State<InvestDetailsScreen> createState() => _InvestDetailsScreenState();
}

class _InvestDetailsScreenState extends State<InvestDetailsScreen> {
  String? _selectedLabel; // Track the selected container

  Widget _buildSelectableContainer(String label) {
    final bool isSelected = _selectedLabel == label; // Check if selected

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLabel = label; // Update selected label
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.only(top: 22),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        child: Text(
          label.replaceAll("₦", "\u20A6"), // Ensure ₦ symbol renders correctly
          style: TextStyle(
            color: isSelected ? AppColors.lightGrey2 : AppColors.blackColor2,
            fontWeight: FontWeight.bold,
            fontFamily: "Karla",
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.grey.shade200),
            DraggableScrollableSheet(
              initialChildSize: 0.8,
              minChildSize: 0.4,
              maxChildSize: 1.0,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 58),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Image Section
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  AssetPath.logo1,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "20%",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.greenColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Karla",
                                    ),
                                  ),
                                  Text(
                                    "Returns in 9 months",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.text1Color,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Karla",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Propertyvest Estate Investment",
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColors.blackColor2,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Karla"),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "by Propertyvest",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: AppColors.blackColor2,
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Selectable Containers
                          Wrap(
                            spacing: 22,
                            children: [
                              _buildSelectableContainer("5,000"),
                              _buildSelectableContainer("10,000"),
                              _buildSelectableContainer("₦20,000"),
                              _buildSelectableContainer("₦50,000"),
                              _buildSelectableContainer("Enter other amount"),
                            ],
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            "Phone number",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColors.text1Color,
                                fontFamily: "Karla"),
                          ),

                          _buildCustomTextField(labelText: "Phone Number"),
                          const SizedBox(height: 21),

                          const Text(
                            "Customers name",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColors.text1Color,
                                fontFamily: "Karla"),
                          ),
                          _buildCustomTextField(labelText: "Customer Name"),
                          const SizedBox(height: 21),
                          const Text(
                            "Pin",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColors.text1Color,
                                fontFamily: "Karla"),
                          ),
                          _buildCustomTextField(
                              labelText: "PIN", isObscured: true),
                          const SizedBox(height: 30),

                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: AppColors.colorBlue,

                              ),
                              child: const Text(
                                "INVEST NOW",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whiteColor,
                                    fontFamily: "Karla"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Learn more about the investment >",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.colorBlue,
                                    fontFamily: "Karla"
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

Widget _buildCustomTextField(
    {required String labelText, bool isObscured = false}) {
  // FocusNode to track the focus state
  FocusNode focusNode = FocusNode();

  // Set initial fill color
  Color currentFillColor = Colors.white;
  return Focus(
    onFocusChange: (hasFocus) {
      currentFillColor = hasFocus
          // ? Color(0xFF999999).withOpacity(0.05)
          ? Colors.black
          : Colors.white; // Default color when not focused
    },
    child: TextField(
      obscureText: isObscured,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: currentFillColor,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFE4E4E4).withOpacity(0.6),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFE4E4E4).withOpacity(0.6),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFF999999).withOpacity(0.6),
          ),
        ),
      ),
    ),
  );
}

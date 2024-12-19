import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String amount;
  final String unit;
  final String status;
  final String subtitle;
  final String subtitle2;
  final String imageUrl; // Added image URL parameter
  final VoidCallback? onTap;

  const InvestmentCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.status,
    required this.unit,
    required this.subtitle,
    required this.subtitle2,
    required this.imageUrl, // Pass image path
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 272,
        height: 174,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          color: AppColors.whiteColor,
          shadowColor: AppColors.borderColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with Image, Subtitle, and Subtitle2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image Section
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imageUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Karla",
                          ),
                        ),
                        Text(
                          subtitle2,
                          style: const TextStyle(
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
                const SizedBox(height: 16), // Space after the row

                // Other Content Section
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Karla",
                    color: AppColors.text1Color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Karla",
                    color: AppColors.text1Color,
                  ),
                ),

                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      unit,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Karla",
                        color: AppColors.text1Color,
                      ),
                    ),
                    const SizedBox(width: 120),
                    // Container for the status with dynamic color
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: status == "Still selling" ? AppColors.greenBgColor : AppColors.redBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: status == "Still selling" ? Colors.green : AppColors.redText, // White text for visibility
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

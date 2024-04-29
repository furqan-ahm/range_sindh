import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_sindh/controllers/dashboard_controller.dart';
import 'package:range_sindh/screens/widgets/custom_text_field.dart';

class AddRecordDialog extends StatelessWidget {
  const AddRecordDialog._({Key? key}) : super(key: key);

  static Future<bool?> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const AddRecordDialog._();
      },
    );
  }


  DashboardController get controller =>Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adding New Sale',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomFormField(
                            labelText: 'Article Name',
                            controller: controller.articleName,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            labelText: 'Fabric Cost',
                            controller: controller.fabricCost,
                            numbersOnly: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            labelText: 'Fare',
                            controller: controller.fareCost,
                            numbersOnly: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            labelText: 'Working Cost',
                            controller: controller.workingCost,
                            numbersOnly: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomFormField(
                            labelText: 'Discount % ',
                            
                            numbersOnly: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            labelText: 'Profit Margin %',
                            controller: controller.profitMargin,
                            numbersOnly: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            labelText: 'Selling Price',
                            controller: controller.sellingPrice,
                            numbersOnly: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 1,
                      height: 300,
                      color: Colors.red,
                    ),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Total Expenses',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '24 RS',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Total Expenses+Fabric Cost',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '24 RS',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Selling Price w/out Fabric  ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '24 RS',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_sindh/controllers/AddRecordController.dart';
import 'package:range_sindh/controllers/dashboard_controller.dart';
import 'package:range_sindh/screens/widgets/CustomElevatedButton.dart';
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

  AddRecordController get controller => Get.put(AddRecordController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
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
                              autofocus: true,
                              controller: controller.articleName,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              labelText: 'Fabric Cost',
                              controller: controller.fabricCost,
                              onChanged: (val) => controller.calculateStuff(),
                              numbersOnly: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              labelText: 'Fare',
                              controller: controller.fareCost,
                              onChanged: (val) => controller.calculateStuff(),
                              numbersOnly: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              labelText: 'Working Cost',
                              controller: controller.workingCost,
                              onChanged: (val) => controller.calculateStuff(),
                              numbersOnly: true,
                            ),
                           
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              labelText: 'Profit Margin %',
                              controller: controller.profitMargin,
                              onChanged: (val) => controller.calculateStuff(),
                              numbersOnly: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              labelText: 'Selling Price',
                              controller: controller.sellingPrice,
                              onChanged: (val) => controller.calculateProfit(),
                              numbersOnly: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              labelText: 'Discount % ',
                              controller: controller.discountPrice,
                              onChanged: (val) => controller.calculateStuff(),
                              numbersOnly: true,
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
                      Expanded(
                        child: GetBuilder(
                            init: controller,
                            builder: (controller) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Obx(
                                      () => Row(
                                        children: [
                                          const Text(
                                            'Total Expenses',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${controller.totalExpense.value.toStringAsFixed(2)} RS',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                 if(controller.discountAmount>0)
                                 ...[ const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Discount Amount',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '-${controller.discountAmount.toStringAsFixed(2)} RS',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),],
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Obx(
                                      () => Row(
                                        children: [
                                          const Text(
                                            'Final Selling Price',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${controller.finalSellingPrice.value.toStringAsFixed(2)} RS',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                         Text(
                                          '${controller.finalProfitPercent.isNegative?"LOSS!":"Profit Earned"} (${controller.finalProfitPercent.toString()}%)',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${controller.profitEarned.toStringAsFixed(2)} RS',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  CustomButton(
                                    fullWidth: true,
                                    buttonText: "Add Sale",
                                    onPressed: controller.addSale,
                                  )
                                 
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_sindh/controllers/dashboard_controller.dart';
import 'package:range_sindh/models/record_model.dart';

final List<String> columnHeaders = [
  "Sr.no",
  "Article\nName",
  "Fabric\nCost",
  "Working\nCost",
  "Expenses+\nFare",
  "Total Expenses",
  "Selling Price",
  "Discount %",
  "Final Price",
  "Profit",
];

class CustomDataTable extends GetView<DashboardController> {
  const CustomDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {


        var records=controller.salesRecord.toList();

        return Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.top,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: List.generate(
                  columnHeaders.length,
                  (index) => DataColumn(
                    label: Text(
                      columnHeaders[index],
                    ),
                  ),
                ),
                dividerThickness: 2,
                border: TableBorder.all(color: Colors.black38),
                rows: records
                    .map(
                      (record) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              record.index.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.articleName.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.fabricCost.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.workingCost.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.fareCost.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.totalExpenseWithFabric.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.sellingPrice.toString(),
                            ),
                          ),
                         
                          DataCell(
                            Text(
                              record.discount.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.soldPrice.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              record.profitEarned.toString(),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList()),
          ),
        );
      }
    );
  }
}

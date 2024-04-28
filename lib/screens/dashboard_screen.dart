import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:range_sindh/screens/widgets/spring_button.dart';

class InsertDataDialog extends StatelessWidget {
  const InsertDataDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        child: const Text('Huh.'),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          constraints: BoxConstraints(minHeight: Get.height),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ajrak_texture.jpg'),
              opacity: 0.7,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Center(
            child: Container(
              width: Get.width,
              constraints: const BoxConstraints(minHeight: 720),
              // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/avatar.svg',
                            height: 60, width: 60),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back!',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.red.shade800, fontSize: 18),
                              ),
                            ),
                            Text(
                              'Administrator',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SpringButton(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_box,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Add a Sale',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SpringButton(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Rang-e-Sindh',
                          style: GoogleFonts.capriola(
                            textStyle: TextStyle(
                                color: Colors.red.shade800, fontSize: 32),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text("Sr.no"),
                            ),
                            DataColumn(
                              label: Text("Article\nName"),
                            ),
                            DataColumn(
                              label: Text("Fabric\nCost"),
                            ),
                            DataColumn(
                              label: Text("Working\nCost"),
                            ),
                            DataColumn(
                              label: Text("Expenses+\nFare"),
                            ),
                            DataColumn(
                              label: Text("Total Expenses\nwith Fabric"),
                            ),
                            DataColumn(
                              label: Text("Selling Price\nwith Fabric"),
                            ),
                            DataColumn(
                              label: Text("Total\nExpenses"),
                            ),
                            DataColumn(
                              label: Text("Selling Price\nw/out Fabric"),
                            ),
                            DataColumn(
                              label: Text("Profit\nMargin %"),
                            ),
                            DataColumn(
                              label: Text("Discount %"),
                            ),
                          ],
                          rows: [
                            DataRow(
                                cells: List.generate(
                                    11, (index) => const DataCell(TextField())))
                          ],
                        ),
                      ),
                    ),
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

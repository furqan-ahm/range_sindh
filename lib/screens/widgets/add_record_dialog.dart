import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Adding New Sale',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  labelText: 'Article Name',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  labelText: 'Fabric Cost',
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

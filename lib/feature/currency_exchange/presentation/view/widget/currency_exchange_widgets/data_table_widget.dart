import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key, required this.displayedData});
  final List<Map<String, dynamic>> displayedData;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filledData = List.from(displayedData);
    while (filledData.length < 5) {
      filledData.add({
        "date": "",
        "from": "",
        "to": "",
        "price": "",
      });
    }
    return SizedBox(
      width: 339.w,
      child: DataTable(
        sortAscending: false,
        columnSpacing: 30,
        dataTextStyle: AppStyles.font10SemiBold.copyWith(color: AppColors.grey),
        headingTextStyle: AppStyles.font12SemiBold
            .copyWith(color: AppColors.blue.withOpacity(.7)),
        decoration: const BoxDecoration(color: AppColors.white),
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => AppColors.white,
        ),
        border: TableBorder.all(color: AppColors.blue),
        columns: const [
          DataColumn(label: Text("Date")),
          DataColumn(label: Text("From")),
          DataColumn(label: Text("To")),
          DataColumn(label: Text("Price"))
        ],
        rows: filledData
            .map((row) => DataRow(cells: [
                  DataCell(Text(row["date"])),
                  DataCell(Text(row["from"])),
                  DataCell(Text(row["to"])),
                  DataCell(Text(row["price"].toString()))
                ]))
            .toList(),
      ),
    );
  }
}

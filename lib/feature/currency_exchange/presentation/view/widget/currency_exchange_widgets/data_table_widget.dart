import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key, required this.displayedData});
  final List<Map<String, dynamic>> displayedData;

  @override
  Widget build(BuildContext context) {
    while (displayedData.length < 5) {
      displayedData.add({
        "date": "",
        "from": "",
        "to": "",
        "price": "",
      });
    }
    return DataTable(
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
      rows: displayedData
          .map((row) => DataRow(cells: [
                DataCell(Text(row["date"])),
                DataCell(Text(row["from"])),
                DataCell(Text(row["to"])),
                DataCell(Text(row["price"].toString()))
              ]))
          .toList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:winnerssacco/pages/loans/loan_statement_2.dart';
import 'package:winnerssacco/pages/loans/provider_loans.dart';

class LoanStatement extends StatelessWidget {
  LoanStatement({this.uid});
  String uid;
  @override
  Widget build(BuildContext context) {

    var f = NumberFormat("###,###", "en_US");
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xffC2151C),
        centerTitle: true,
        title: const Text('All your Loan Repayments'),
      ),
      body: ChangeNotifierProvider<MyHomePageProvider>(
        create: (context) => MyHomePageProvider(),
        child: Consumer<MyHomePageProvider>(
          builder: (context, provider, child) {
            if (provider.data == null) {
              provider.getData(context,uid);
              return const Center(child: CircularProgressIndicator());
            }
            // when we have the json loaded... let's put the data into a data table widget
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Loan No.'),
                        tooltip: 'represents loan no.'),
                    DataColumn(
                        label: Text('Date Created'),
                        tooltip: 'represents date the loan was initiated'),
                    DataColumn(
                        label: Text('Total Loan Amount'),
                        tooltip: 'represents total loan amount'),
                    DataColumn(
                        label: Text('OutStanding Balance'),
                        tooltip: 'represents outstanding balance'),
                    DataColumn(
                        label: Text('Status'),
                        tooltip: 'represents loan status'),
                    DataColumn(
                        label: Text('Date of Next Repayment'),
                        tooltip: 'represents date of next repayment'),
                    DataColumn(
                        label: Text('Installment'),
                        tooltip: 'Installment return expected'),
                  ],
                  rows: provider.data.data
                      .map((data) =>
                  // we return a DataRow every time
                  DataRow(
                      onSelectChanged: (bool selected) {
                        if (selected) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoanStatement2(uid,data.loanNo)));
                        }
                      },
                    // List<DataCell> cells is required in every row
                      cells: [

                        // I want to display a green color icon when user is verified and red when unverified
                        DataCell(Text(data.loanNo)),
                        DataCell(Text(data.dateCreated)),
                        DataCell(Text(f.format(int.parse(data.totalLoanAmount)))),
                        DataCell(Text(f.format(int.parse(data.balance)))),

                        DataCell(Text(data.status)),

                        DataCell(Text(data.dateNextPay)),
                        DataCell(Text(f.format(int.parse(data.installment)))),
                      ]))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
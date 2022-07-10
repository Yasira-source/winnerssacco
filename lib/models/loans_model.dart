class AutoGenerate {
  AutoGenerate({
     this.data,

  });
   List<Data> data;


  AutoGenerate.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();

    return _data;
  }
}

class Data {
  Data({
     this.loanNo,
     this.observations,
     this.accBalance,
     this.monthlyInterestRate,
     this.loanDuration,
     this.interestAmount,
     this.totalLoanAmount,
     this.accountId,
     this.accNo,
     this.balance,
     this.customerName,
     this.principal,
     this.dateDisbursed,
     this.status,
     this.loanType,
     this.dateCreated,
     this.dateNextPay,
     this.dateFirstPay,
     this.installment,
     this.cycle,
  });
   String loanNo;
   String observations;
   String accBalance;
   String monthlyInterestRate;
   String loanDuration;
   String interestAmount;
   String totalLoanAmount;
   String accountId;
   String accNo;
   String balance;
   String customerName;
   String principal;
   String dateDisbursed;
   String status;
   String loanType;
   String dateCreated;
   String dateNextPay;
   String dateFirstPay;
   String installment;
   String cycle;

  Data.fromJson(Map<String, dynamic> json){
    loanNo = json['loan_no'];
    observations = json['observations'];
    accBalance = json['acc_balance'];
    monthlyInterestRate = json['monthly_interest_rate'];
    loanDuration = json['loan_duration'];
    interestAmount = json['interest_amount'];
    totalLoanAmount = json['total_loan_amount'];
    accountId = json['account_id'];
    accNo = json['acc_no'];
    balance = json['balance'];
    customerName = json['customer_name'];
    principal = json['principal'];
    dateDisbursed = json['date_disbursed'];
    status = json['status'];
    loanType = json['loan_type'];
    dateCreated = json['date_created'];
    dateNextPay = json['date_next_pay'];
    dateFirstPay = json['date_first_pay'];
    installment = json['installment'];
    cycle = json['cycle'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['loan_no'] = loanNo;
    _data['observations'] = observations;
    _data['acc_balance'] = accBalance;
    _data['monthly_interest_rate'] = monthlyInterestRate;
    _data['loan_duration'] = loanDuration;
    _data['interest_amount'] = interestAmount;
    _data['total_loan_amount'] = totalLoanAmount;
    _data['account_id'] = accountId;
    _data['acc_no'] = accNo;
    _data['balance'] = balance;
    _data['customer_name'] = customerName;
    _data['principal'] = principal;
    _data['date_disbursed'] = dateDisbursed;
    _data['status'] = status;
    _data['loan_type'] = loanType;
    _data['date_created'] = dateCreated;
    _data['date_next_pay'] = dateNextPay;
    _data['date_first_pay'] = dateFirstPay;
    _data['installment'] = installment;
    _data['cycle'] = cycle;
    return _data;
  }
}
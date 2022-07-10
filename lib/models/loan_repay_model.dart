class AutoGenerate3 {
  AutoGenerate3({
     this.data,
     this.success,
     this.statusCode,
     this.count,
  });
    List<Data> data;
    bool success;
    String statusCode;
    int count;

  AutoGenerate3.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    success = json['success'];
    statusCode = json['statusCode'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['success'] = success;
    _data['statusCode'] = statusCode;
    _data['count'] = count;
    return _data;
  }
}

class Data {
  Data({
     this.did,
     this.accountNo,
     this.accountName,
     this.authorisedby,
     this.paidbyName,
     this.paidbyPhone,
     this.amount,
     this.reason,
     this.status,
     this.branchName,
     this.accBalance,
     this.loanBalance,
     this.pending,
     this.dateCreated,
     this.method,
  });
    String did;
    String accountNo;
    String accountName;
    String authorisedby;
    String paidbyName;
    String paidbyPhone;
    String amount;
    String reason;
    String status;
    String branchName;
    String accBalance;
    String loanBalance;
    String pending;
    String dateCreated;
    String method;

  Data.fromJson(Map<String, dynamic> json){
    did = json['_did'];
    accountNo = json['_account_no'];
    accountName = json['account_name'];
    authorisedby = json['_authorisedby'];
    paidbyName = json['_paidby_name'];
    paidbyPhone = json['_paidby_phone'];
    amount = json['_amount'];
    reason = json['_reason'];
    status = json['_status'];
    branchName = json['branch_name'];
    accBalance = json['acc_balance'];
    loanBalance = json['loan_balance'];
    pending = json['pending'];
    dateCreated = json['_date_created'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_did'] = did;
    _data['_account_no'] = accountNo;
    _data['account_name'] = accountName;
    _data['_authorisedby'] = authorisedby;
    _data['_paidby_name'] = paidbyName;
    _data['_paidby_phone'] = paidbyPhone;
    _data['_amount'] = amount;
    _data['_reason'] = reason;
    _data['_status'] = status;
    _data['branch_name'] = branchName;
    _data['acc_balance'] = accBalance;
    _data['loan_balance'] = loanBalance;
    _data['pending'] = pending;
    _data['_date_created'] = dateCreated;
    _data['method'] = method;
    return _data;
  }
}
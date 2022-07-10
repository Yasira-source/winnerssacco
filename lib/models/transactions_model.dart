class TransactionsData {
  TransactionsData({
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
    this.pending,
    this.dateCreated,
    this.address,
    this.type,
    this.mdate,
    this.role,
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
  String pending;
  String dateCreated;
  String address;
  String type;
  String mdate;
  String role;


  TransactionsData.fromJson(dynamic json){
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
    pending = json['pending'];
    dateCreated = json['_date_created'];
    address = json['address'];
    type = json['type'];
    mdate = json['mdate'];
    role = json['role'];
  }

}

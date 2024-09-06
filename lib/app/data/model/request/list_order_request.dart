class ListOrderRequest {
  String? fromDate;
  String? toDate;
  String? code;
  int? exploitedBy;
  String? filterDateBy;
  String? customer;
  String? exploitStatus;
  int? page;
  int? pageSize;

  ListOrderRequest(
      {this.fromDate,
      this.toDate,
      this.code,
      this.exploitedBy,
      this.filterDateBy,
      this.customer,
      this.exploitStatus,
      this.page,
      this.pageSize});
}

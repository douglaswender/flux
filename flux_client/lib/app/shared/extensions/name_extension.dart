extension NameExtension on String? {
  String firstName() => this!.split(" ").first;

  String secondName() => this!.split(" ")[0] + " " + this!.split(" ")[1];

  String simplifyCodeId() => this!.substring(this!.length - 8);

  String dateFormat() {
    String parsedDate = "";
    List<String> splited = this!.substring(0, 10).split('-');

    if (splited.length > 1) {
      String year = splited[0];
      String month = splited[1];
      String day = splited[2];

      parsedDate = day + '/' + month + '/' + year;
    }

    return parsedDate;
  }
}

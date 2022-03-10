extension NameExtension on String? {
  String firstName() => this!.split(" ").first;

  String secondName() => this!.split(" ")[0] + " " + this!.split(" ")[1];

  String simplifyCodeId() => this!.substring(this!.length - 5);
}

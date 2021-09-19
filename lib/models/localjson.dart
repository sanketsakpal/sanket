class Example {
  String? response;
  String? responseMassage;
  List<Times>? times;

  Example({this.response, this.responseMassage, this.times});

  Example.fromJson(Map<String, dynamic> json) {
    this.response = json["response"];
    this.responseMassage = json["response_massage"];
    this.times = json["times"] == null
        ? null
        : (json["times"] as List).map((e) => Times.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["response"] = this.response;
    data["response_massage"] = this.responseMassage;
    if (this.times != null)
      data["times"] = this.times?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Times {
  String? username;
  String? age;

  Times({this.username, this.age});

  Times.fromJson(Map<String, dynamic> json) {
    this.username = json["username"];
    this.age = json["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.username;
    data["age"] = this.age;
    return data;
  }
}

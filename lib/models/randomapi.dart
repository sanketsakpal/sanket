class Random {
  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  String? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  Random(
      {this.id,
      this.uid,
      this.password,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.avatar,
      this.gender,
      this.phoneNumber,
      this.socialInsuranceNumber,
      this.dateOfBirth,
      this.employment,
      this.address,
      this.creditCard,
      this.subscription});

  Random.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.uid = json["uid"];
    this.password = json["password"];
    this.firstName = json["first_name"];
    this.lastName = json["last_name"];
    this.username = json["username"];
    this.email = json["email"];
    this.avatar = json["avatar"];
    this.gender = json["gender"];
    this.phoneNumber = json["phone_number"];
    this.socialInsuranceNumber = json["social_insurance_number"];
    this.dateOfBirth = json["date_of_birth"];
    this.employment = json["employment"] == null
        ? null
        : Employment.fromJson(json["employment"]);
    this.address =
        json["address"] == null ? null : Address.fromJson(json["address"]);
    this.creditCard = json["credit_card"] == null
        ? null
        : CreditCard.fromJson(json["credit_card"]);
    this.subscription = json["subscription"] == null
        ? null
        : Subscription.fromJson(json["subscription"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["uid"] = this.uid;
    data["password"] = this.password;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["username"] = this.username;
    data["email"] = this.email;
    data["avatar"] = this.avatar;
    data["gender"] = this.gender;
    data["phone_number"] = this.phoneNumber;
    data["social_insurance_number"] = this.socialInsuranceNumber;
    data["date_of_birth"] = this.dateOfBirth;
    if (this.employment != null) data["employment"] = this.employment?.toJson();
    if (this.address != null) data["address"] = this.address?.toJson();
    if (this.creditCard != null)
      data["credit_card"] = this.creditCard?.toJson();
    if (this.subscription != null)
      data["subscription"] = this.subscription?.toJson();
    return data;
  }
}

class Subscription {
  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  Subscription({this.plan, this.status, this.paymentMethod, this.term});

  Subscription.fromJson(Map<String, dynamic> json) {
    this.plan = json["plan"];
    this.status = json["status"];
    this.paymentMethod = json["payment_method"];
    this.term = json["term"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["plan"] = this.plan;
    data["status"] = this.status;
    data["payment_method"] = this.paymentMethod;
    data["term"] = this.term;
    return data;
  }
}

class CreditCard {
  String? ccNumber;

  CreditCard({this.ccNumber});

  CreditCard.fromJson(Map<String, dynamic> json) {
    this.ccNumber = json["cc_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["cc_number"] = this.ccNumber;
    return data;
  }
}

class Address {
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  Address(
      {this.city,
      this.streetName,
      this.streetAddress,
      this.zipCode,
      this.state,
      this.country,
      this.coordinates});

  Address.fromJson(Map<String, dynamic> json) {
    this.city = json["city"];
    this.streetName = json["street_name"];
    this.streetAddress = json["street_address"];
    this.zipCode = json["zip_code"];
    this.state = json["state"];
    this.country = json["country"];
    this.coordinates = json["coordinates"] == null
        ? null
        : Coordinates.fromJson(json["coordinates"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["city"] = this.city;
    data["street_name"] = this.streetName;
    data["street_address"] = this.streetAddress;
    data["zip_code"] = this.zipCode;
    data["state"] = this.state;
    data["country"] = this.country;
    if (this.coordinates != null)
      data["coordinates"] = this.coordinates?.toJson();
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    this.lat = json["lat"];
    this.lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["lat"] = this.lat;
    data["lng"] = this.lng;
    return data;
  }
}

class Employment {
  String? title;
  String? keySkill;

  Employment({this.title, this.keySkill});

  Employment.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.keySkill = json["key_skill"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["key_skill"] = this.keySkill;
    return data;
  }
}

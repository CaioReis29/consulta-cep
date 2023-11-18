class Cep {
  String? cep;
  String? state;
  String? city;
  String? neighborhood;
  String? street;

  Cep({
    this.cep,
    this.state,
    this.city,
    this.neighborhood,
    this.street,
  });

  Cep.fromJson(Map<String, dynamic> json) {
    cep = json['cep'] ?? "";
    state = json['state'] ?? "";
    city = json['city'] ?? "";
    neighborhood = json['neighborhood'] ?? "";
    street = json['street'] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "cep": cep,
      "state": state,
      "city": city,
      "neighborhood": neighborhood,
      "street": street,
    };
  }
}

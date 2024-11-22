import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    int? id;
    String address;
    String neighborhood;
    int idUser;

    Address({
        this.id,
        required this.address,
        required this.neighborhood,
        required this.idUser,
    });

    static List<Address> fromJsonList(List<dynamic> jsonList) {
      List<Address> toList = [];
      jsonList.forEach((item) { 
        Address address = Address.fromJson(item);
        toList.add(address);
      });
      return toList;
    }

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        neighborhood: json["neighborhood"],
        idUser: json["id_user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "neighborhood": neighborhood,
        "id_user": idUser,
    };
}
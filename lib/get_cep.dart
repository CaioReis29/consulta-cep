import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:validador_cep/cep_model.dart';

class GetCep {
  Future<Cep> getCep(String cep) async {
    //aqui vocês colocam os parâmetros da função, o unico que vão chamar na pagina é do cep
    String token = "5467|5jLvJlI24olpOjfydhwdbsNpOxYivCBY";

    final Dio dio = Dio();

    final response =
        await dio.get("https://api.invertexto.com/v1/cep/$cep?token=$token");

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Cep.fromJson(
        response.data,
      ); // assim ele retorna o modelo da função
    }
  }
}


  //https://api.invertexto.com/v1/cep/50711090?token=5467|5jLvJlI24olpOjfydhwdbsNpOxYivCBY
  //                                  |  cep |       | token                              |
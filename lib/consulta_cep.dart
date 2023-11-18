import 'package:flutter/material.dart';
import 'package:validador_cep/get_cep.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  final cepController = TextEditingController();

  final service = GetCep(); // aqui vou poder chamar a requisição

  String cep = "";
  String estado = "";
  String cidade = "";
  String bairro = "";
  String rua = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 238, 161, 187),
            Colors.white,
          ]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Consulta de CEP",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: TextFormField(
                    controller: cepController,
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    final infos = await service.getCep(
                      cepController.text,
                    );
                    setState(() {
                      cep = infos.cep!;
                      estado = infos.state!;
                      cidade = infos.city!;
                      bairro = infos.neighborhood!;
                      rua = infos.street!;
                    });
                  }, // chamando a função após clicar
                  child: const Text(
                    "Confirmar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "CEP: $cep",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Estado: $estado",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cidade: $cidade",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Bairro: $bairro",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rua: $rua",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

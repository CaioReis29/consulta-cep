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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
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
              child: const Text("consulta de cpf"),
            ),
            Text(
              "CEP: $cep",
              textAlign: TextAlign.left,
            ),
            Text(
              "Estado: $estado",
              textAlign: TextAlign.left,
            ),
            Text(
              "Cidade: $cidade",
              textAlign: TextAlign.left,
            ),
            Text(
              "Bairro: $bairro",
              textAlign: TextAlign.left,
            ),
            Text("Rua: $rua"),
          ],
        ),
      ),
    );
  }
}

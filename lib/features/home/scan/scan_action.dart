import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../presentation/scan_result/scan_result.dart';

class ScanAction extends StatelessWidget {
  const ScanAction({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff6C3428),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const Text(
            'Scan The QR Code Of The Artifact',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xff6C3428),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              BarcodeWidget(
                data: value,
                barcode: Barcode.qrCode(),
                color: const Color(0xff6C3428),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.29,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.007,
                width: MediaQuery.of(context).size.height * 0.45,
                color: const Color(0xffBE8C63),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanResult()));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                'Please Wait Few Second While Loading Data .',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffBE8C63),
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/botton_sheet/botton_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_buttons/set_buttons_widget.dart';

import 'barcode_scanner_controller.dart';
import 'barcode_scanner_status.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, '/insert_boleto');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  color: Colors.blue,
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  title: Text(
                    'Escaneie o código de barras do boleto',
                  ),
                  leading: BackButton(color: AppColors.background)),
              body: Column(
                children: [
                  Expanded(
                    child: Container(color: Colors.black),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.transparent),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.black),
                  ),
                ],
              ),
              bottomNavigationBar: SetButtonsWidget(
                labelPrimary: 'Inserir código do boleto',
                onTapPrimary: () {
                  controller.status = BarcodeScannerStatus.error('Error');
                },
                labelSencondary: 'Adicionar da galeria',
                onTapSecondary: controller.scanWithImagePicker,
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomSheetWidget(
                    labelPrimary: 'Escanear novamente',
                    labelSecondary: 'Digitar código',
                    onTapPrimary: () {
                      controller.scanWithCamera();
                    },
                    onTapSecondary: () {},
                    subtitle:
                        'Não foi possível identificar um código de barras.',
                    title:
                        'Tente escanear novamente ou digite o código do seu boleto.',
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

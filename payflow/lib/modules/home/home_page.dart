import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];

  void handleCurrentPage(int index) {
    controller.setCurrentPage(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Column(
            children: [
              SizedBox(height: paddingTop + 5),
              ListTile(
                title: Text.rich(
                  TextSpan(
                    text: 'Olá, ',
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: 'Alisson',
                        style: TextStyles.titleBoldBackground,
                      )
                    ],
                  ),
                ),
                subtitle: Text(
                  'Mantenha suas contas em dia',
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => handleCurrentPage(0),
              icon: Icon(
                Icons.home,
                color: AppColors.primary,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/barcode_scanner');
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () => handleCurrentPage(1),
              icon: Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
            )
          ],
        ),
      ),
    );
  }
}

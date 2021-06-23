import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.375,
            decoration: AppColors.decorationRadialGradient,
            alignment: Alignment.bottomCenter,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: paddingTop + 37),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/person.png',
                      height: size.height * 0.373,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 206,
                        height: 92,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -0.7),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              const Color(0x00ffffff),
                              const Color(0xccffffff),
                              const Color(0xf0ffffff),
                              const Color(0xffffffff)
                            ],
                            stops: [0.0, 0.50, 0.694, 1.0],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset('assets/images/logomini.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 27, 70, 0),
                child: Text(
                  'Organize seus\nboletos em um \nsó lugar',
                  style: TextStyles.titleHome,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 65),
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.shape,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.stroke),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(AppImages.google),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: AppColors.stroke),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Entrar com Google',
                          style: TextStyles.buttonGray,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

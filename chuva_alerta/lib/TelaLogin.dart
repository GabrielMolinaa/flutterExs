import 'package:flutter/material.dart';

class Telalogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 667,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 45,
                top: 266,
                child: Container(
                  width: 286,
                  height: 47,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 286,
                          height: 47,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF5F3F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 11,
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            color: Color(0xFFC0BABA),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 116,
                top: 492,
                child: Container(
                  width: 143,
                  height: 17,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Color(0xFF4EBB73),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 633,
                child: Container(
                  width: 264,
                  height: 17,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Não tem uma conta? ',
                              style: TextStyle(
                                color: Color(0xFF4EBB73),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Cadastre-se aqui',
                              style: TextStyle(
                                color: Color(0xFF3D8656),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '!',
                              style: TextStyle(
                                color: Color(0xFF4EBB73),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 333,
                child: Container(
                  width: 286,
                  height: 47,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 286,
                          height: 47,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF5F3F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 11,
                        child: Text(
                          'Senha',
                          style: TextStyle(
                            color: Color(0xFFC0BABA),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 434,
                child: Container(
                  width: 286,
                  height: 47,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 286,
                          height: 47,
                          decoration: ShapeDecoration(
                            color: Color(0xFF4EBB73),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 113,
                        top: 11,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 155,
                top: 117,
                child: Container(
                  width: 65,
                  height: 65,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/65x65"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
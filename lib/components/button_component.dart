import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  String text = '';
  var gradient1;
  var gradient2;

  ButtonComponent(this.text, this.gradient1, this.gradient2);

  @override
  Widget build(BuildContext context) {
    return Container(
                      width: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            gradient1,
                            gradient2,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.5, 0.0),
                        stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0))
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          text,
                          textAlign: TextAlign.center,
                      ),
                    );
  }
}
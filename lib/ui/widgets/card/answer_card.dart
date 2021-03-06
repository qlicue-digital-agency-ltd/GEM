import 'package:flutter/material.dart';
import 'package:gem/models/answer.dart';
import 'package:gem/scoped-model/main.dart';

typedef AnswerCardOnTap = Function();

class AnswerCard extends StatelessWidget {
  final MainModel model;
  final Answer answer;
  final AnswerCardOnTap onTap;
  const AnswerCard(
      {Key key,
      @required this.answer,
      @required this.onTap,
      @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: answer.isSelected
                ? Theme.of(context).primaryColor
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          height: 60,
          child: Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              answer.isSelected
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(answer.alphabet,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
              Container(
                width: 10,
              ),
              Expanded(
                child: Text(
                  answer.content,
                  style: TextStyle(
                      color: answer.isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: 10,
              ),
              answer.isSelected
                  ? InkWell(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Container(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

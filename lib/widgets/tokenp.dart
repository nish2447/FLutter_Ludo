import 'package:flutter/material.dart';
import '../gameengine/model/dice_model.dart';
import '../gameengine/model/game_state.dart';
import '../gameengine/model/token.dart';
import 'package:provider/provider.dart';

int col=1;


class Tokenp extends StatefulWidget {
  final Token token;
  final List<double> dimentions;

  Tokenp(this.token, this.dimentions);

  @override
  State<Tokenp> createState() => _TokenpState();
}

class _TokenpState extends State<Tokenp> {
  Function(Token)callBack;


  Color _getcolor() {
    switch (this.widget.token.type) {
      case TokenType.green:
        return Colors.green;
      case TokenType.yellow:
        return Colors.yellow[900];
      case TokenType.blue:
        return Colors.blue[600];
      case TokenType.red:
        return Colors.red;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    final dice = Provider.of<DiceModel>(context);
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      left: widget.dimentions[0],
      top: widget.dimentions[1],
      width: widget.dimentions[2],
      height: widget.dimentions[3],
      child: GestureDetector(
           onTap: (){
             //moving tokens takes place from this call
             //need to re organise this so that we control which token to move
             if(widget.token.type.index == dice.col ) {
               print(dice.col);
               gameState.moveToken(widget.token, dice.diceOne);
             }
           },
              child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getcolor(),
                boxShadow: [
                  BoxShadow(
                    color: _getcolor(),
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                  )
                ]),
          ),
        ),
      ),
    );
  }
}


// select no one of players
// randomize the beginning player
//then distribute according to it




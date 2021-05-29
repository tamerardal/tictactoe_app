import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sayacX = 0, sayacO = 0, bosKutular = 0;
  bool ohTurn = true;
  List<String> displayEx0h = ['', '', '', '', '', '', '', '', ''];

  static var myNewFont = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 36,
    letterSpacing: 3,
  ));
  static var myNewFontWhite = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 12,
  ));
  static var myNewFontWhite2 = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 18,
  ));

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "O Oyuncusu\n",
                        style: myNewFontWhite,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$sayacO",
                        style: myNewFontWhite,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "X Oyuncusu\n",
                        style: myNewFontWhite,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$sayacX",
                        style: myNewFontWhite,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800])),
                    child: Center(
                      child: Text(
                        displayEx0h[index],
                        style: myNewFont,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                "TIC TAC TOE",
                style: myNewFontWhite2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'O';
        bosKutular++;
      } else if (!ohTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'X';
        bosKutular++;
      }
      ohTurn = !ohTurn;
      chechWinner();
    });
  }

  void chechWinner() {
    // 1. satır kontolü
    if (displayEx0h[0] == displayEx0h[1] &&
        displayEx0h[0] == displayEx0h[2] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }
    // 2. satır kontrolü
    else if (displayEx0h[3] == displayEx0h[4] &&
        displayEx0h[3] == displayEx0h[5] &&
        displayEx0h[3] != '') {
      _showWinDialog(displayEx0h[3]);
    }
    // 3. satır kontrol
    else if (displayEx0h[6] == displayEx0h[7] &&
        displayEx0h[6] == displayEx0h[8] &&
        displayEx0h[6] != '') {
      _showWinDialog(displayEx0h[6]);
    }
    //1. sütun kontrol
    else if (displayEx0h[0] == displayEx0h[3] &&
        displayEx0h[0] == displayEx0h[6] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }
    // 2. sütun kontrol
    else if (displayEx0h[1] == displayEx0h[4] &&
        displayEx0h[1] == displayEx0h[7] &&
        displayEx0h[1] != '') {
      _showWinDialog(displayEx0h[1]);
    }
    // 3. sütun kontrol
    else if (displayEx0h[2] == displayEx0h[5] &&
        displayEx0h[2] == displayEx0h[8] &&
        displayEx0h[2] != '') {
      _showWinDialog(displayEx0h[2]);
    }
    // Sol çapraz
    else if (displayEx0h[0] == displayEx0h[4] &&
        displayEx0h[0] == displayEx0h[8] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }
    // Sağ çapraz
    else if (displayEx0h[2] == displayEx0h[4] &&
        displayEx0h[2] == displayEx0h[6] &&
        displayEx0h[2] != '') {
      _showWinDialog(displayEx0h[2]);
    }
    // Berabere
    else if (bosKutular == 9) {
      _showDrawnDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            "KAZANAN: $winner!",
            style: myNewFontWhite2,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tekrar OYNA!',
                style: myNewFontWhite,
              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    if (winner == 'O') {
      sayacO++;
    } else if (winner == 'X') {
      sayacX++;
    }
  }

  void _showDrawnDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            "Berabere!",
            style: myNewFontWhite2,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tekrar OYNA!',
                style: myNewFontWhite,
              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayEx0h[i] = '';
      }
    });
    bosKutular = 0;
  }
}

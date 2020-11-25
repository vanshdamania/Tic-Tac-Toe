import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: Link up images
  AssetImage cross = AssetImage("Images/cross.png");
  AssetImage circle = AssetImage("Images/circle.png");
  AssetImage edit = AssetImage("Images/edit.png");
  bool isCoross = true;
  String message;
  List<String> gameState;

  Timer _timer;

  delay() {
    _timer = new Timer(const Duration(seconds: 3), () {
      setState(() {
        resetGame();
      });
    });
  }

  //TODO: Initialize the state of box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = '';
    });
  }

  //TODO: Play game method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCoross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCoross = !this.isCoross;
        this.checkWin();
      });
    }
  }

  //TODO: Reset game method
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = '';
    });
  }

  //TODO: Get image method
  AssetImage getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
        break;
      case ("cross"):
        return cross;
        break;
      case ("circle"):
        return circle;
        break;
    }
  }

  //TODO: Wining game logic
  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        delay();
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Wins';
        delay();
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins';
        delay();
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        delay();
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} Wins';
        delay();
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        delay();
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        delay();
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        delay();
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game Draw";
        delay();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tic Tac Toe",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50.0),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Colors.grey[800],
                Colors.black,
              ], radius: 0.85, focal: Alignment.center),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
              color: Colors.deepOrange,
              minWidth: 200.0,
              height: 50.0,
              child: Text(
                'Reset game!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                this.resetGame();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),

          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Developed By',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '@Vansh Damania',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(10.0),
          //   child: Text(
          //     '@Vansh Damania',
          //     style: TextStyle(fontSize: 20.0),
          //   ),
          // )
        ],
      ),
    );
  }
}

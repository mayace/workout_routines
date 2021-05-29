class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var time = 10;
  var playing = false;

  final Map<String, Color> colorList = {
    "on": Colors.blue,
    "off": Colors.transparent,
  };
  Timer timeout;

  String get estadoActual => this.playing ? "playing" : "stop";

  void _playCheckPointSound(String code) async {
    await FlutterBeep.beep();
    sleep(Duration(seconds: 1));
    await FlutterBeep.beep();
    sleep(Duration(milliseconds: 100));
    await FlutterBeep.beep();
    sleep(Duration(milliseconds: 100));
    await FlutterBeep.beep();
  }

  void _minusOne() {
    final newVal = this.time - 1;

    if (newVal > 0) {
      setState(() {
        this.time = newVal;
      });
      this.timeout = Timer(Duration(seconds: 1), this._minusOne);
    } else if (newVal == 0) {
      setState(() {
        this.playing = false;
        this.time = 0;
      });
      _playCheckPointSound(this.estadoActual);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: this.playing ? this.colorList["on"] : this.colorList["off"],
      child: Column(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$estadoActual".toUpperCase(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                )
              ],
            ),
          )),
          Expanded(
              child: MyTimer(
            time: this.time,
          )),
          Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            this.time = 10;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.redo),
                      ),
                      IconButton(
                        onPressed: () {
                          final newVal = !this.playing;

                          if (this.time > 0) {
                            if (newVal) {
                              this.timeout =
                                  Timer(Duration(seconds: 1), this._minusOne);
                            } else {
                              if (this.timeout != null) this.timeout.cancel();
                            }

                            setState(() {
                              this.playing = newVal;
                            });
                          }
                        },
                        icon: Icon(this.playing
                            ? FontAwesomeIcons.pause
                            : FontAwesomeIcons.play),
                      )
                    ],
                  ))),
        ],
      ),
    ));
  }
}

import 'dart:async';
import 'package:bluetooth_sample/src/screens/details_page.dart';
import 'package:bluetooth_sample/src/widgets/bluetooth_device_list_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class HomePage extends StatefulWidget {
  final bool start;

  const HomePage({this.start = true});

  @override
  _DiscoveryPage createState() => _DiscoveryPage();
}

class _DiscoveryPage extends State<HomePage> {
  StreamSubscription<BluetoothDiscoveryResult> _streamSubscription;
  List<BluetoothDiscoveryResult> results = [];
  bool isDiscovering;
  Timer _discoverableTimeoutTimer;

  _DiscoveryPage();

  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      FlutterBluetoothSerial.instance.requestEnable();
      await Future.delayed(Duration(milliseconds: 0xDD));
      return false;
    });

    isDiscovering = widget.start;
    if (isDiscovering) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        results.add(r);
      });
    });

    _streamSubscription.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isDiscovering ? 'Discovering devices' : 'Discovered devices',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          isDiscovering
              ? FittedBox(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: _restartDiscovery,
                ),
        ],
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, index) {
          BluetoothDiscoveryResult result = results[index];
          return BluetoothDeviceTile(
            device: result.device,
            rssi: result.rssi,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(result: result),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

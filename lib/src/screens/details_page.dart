import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DetailsPage extends StatelessWidget {
  final BluetoothDiscoveryResult result;

  const DetailsPage({
    @required this.result,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BluetoothDevice device = result.device;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: textTheme.headline6,
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.05,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.bluetooth,
                color: Colors.blue.shade900,
                size: 200.0,
              ),
              Text(
                device.name ?? 'Unknown Device',
                style: textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text.rich(
                TextSpan(
                  style: textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: 'Device Address: ',
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: device.address,
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.0125,
              ),
              Text.rich(
                TextSpan(
                  style: textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: 'Connection status: ',
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: device.isConnected ? 'Connected' : 'Not Connected',
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.0125,
              ),
              Text.rich(
                TextSpan(
                  style: textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: 'Type: ',
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: device.type.stringValue,
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.0125,
              ),
              Text.rich(
                TextSpan(
                  style: textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: 'Bond state: ',
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: device.bondState.stringValue,
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

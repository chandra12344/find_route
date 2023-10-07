import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:textfield_search/textfield_search.dart';
import '../data/colors.dart';
import '../data/constants.dart';
import '../data/leave_approve_card_decoration.dart';
import '../data/models/res_real_time_data.dart';
import '../main.dart';
import 'SettingsScreen.dart';
import 'map_screen/controller/map_controller.dart';
import 'map_screen/map_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  MapController mapController = Get.put(MapController());
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  DateTime toDateTime = DateTime.now().add(Duration(hours: 1));
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;
  bool toShowDateTime = false;
  DateTime? fromDate, toDate;
  double score = 80.0;
  bool value = false;

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  Future _selectDateTime(BuildContext context, String fromOrTo) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);
    if (time == null) return;

    setState(() {
      if (fromOrTo == 'from') {
        dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      } else {
        toDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      }
    });
  }

  String getDateTime(String fromOrTo) {
    // ignore: unnecessary_null_comparison
    if (fromOrTo == 'from') {
      if (dateTime == null) {
        return 'select date timer';
      } else {
        var x = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);
        fromDate = DateTime.parse(x);
        return DateFormat("yyyy-MM-dd'T'HH:mm").format(dateTime);
      }
    } else {
      if (toDateTime == null) {
        return 'select date timer';
      } else {
        var x = DateFormat("yyyy-MM-dd HH:mm").format(toDateTime);
        toDate = DateTime.parse(x);
        return DateFormat("yyyy-MM-dd'T'HH:mm").format(toDateTime);
      }
    }
  }

  bool compareTime(DateTime fromDate, DateTime toDate) {
    // DateTime y = fromDate.add(Duration(minutes: 15));
    if (fromDate.compareTo(toDate) < 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    mapController.getData();
    super.initState();
    mapController.stationController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("text field: ${mapController.stationController.text}");
  }

  @override
  void dispose() {
    mapController.stationController.dispose();
    super.dispose();
  }

  Future<List> fetchSimpleData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return mapController.stationList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Row(
          children: [
            Text("Dashboard"),
            Spacer(),
            IconButton(onPressed: (){Get.to(SettingsScreen());}, icon: Icon(Icons.settings,color: Colors.white,))

          ],
        )),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment: Alignment.bottomRight,child: SizedBox.fromSize(
                size: Size(56, 56),
                child: ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        Get.to(MainMapScreen());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.navigation_outlined,color: Colors.white,), // <-- Icon
                          Text("route",style: TextStyle(color: Colors.white),), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),),
              Container(
                height: MediaQuery.of(context).size.width * 0.4,
                child: buildSfRadialGauge(context, score),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 20,
              ),
              TextFieldSearch(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    hintText: "Enter Station Name".tr,
                  ),
                  label: '',
                  controller: mapController.stationController,
                  future: () {
                    return fetchSimpleData();
                  }),
              Row(children: [
                Checkbox(
                  value: this.value,
                  onChanged: (value) {
                    if (value != null && value) {
                      showDateTime = true;
                      toShowDateTime = true;
                      mapController.fromdate.text = getDateTime('from');
                      mapController.todate.text = getDateTime('to');
                    } else {
                      mapController.fromdate.text = "";
                      mapController.todate.text = "";
                    }
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                Text("set from date to Current date")
              ]),
              GestureDetector(
                onTap: () async {
                  await _selectDateTime(context, "from");
                  mapController.fromdate.text = getDateTime('from');
                  setState(() {});
                },
                child: Container(
                  height: 45.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  child: TextField(
                    enabled: false,
                    controller: mapController.fromdate,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        hintText: 'from day',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.calendar_month_outlined)),
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await _selectDateTime(context, "to");
                  mapController.todate.text = getDateTime('to');
                  setState(() {});
                },
                child: Container(
                  height: 45.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  child: TextField(
                    enabled: false,
                    controller: mapController.todate,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        hintText: 'To day',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.calendar_month_outlined)),
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        mapController.getRealData();
                      },
                      child: Text("getData"))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 300,
                  child: Obx(
                   ()=> mapController.realTimeDataList.length>1?ListView.builder(
                        itemCount: mapController.realTimeDataList.length-1,
                        itemBuilder: (BuildContext context, int index) {
                          return  CustomDailyPage(data: mapController.realTimeDataList[index],);
                        }):Center(child: Text("data Not found"),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

SfRadialGauge buildSfRadialGauge(BuildContext context, double score) {
  return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 2500,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 1000,

          radiusFactor: MediaQuery.of(context).size.height >= 750 ? 1.1 : 1.0,
          endAngle: 30,
          startAngle: 150,
          // showAxisLine: true,
          showTicks: false,
          showLabels: false,

          // offsetUnit: GaugeSizeUnit.factor,
          canScaleToFit: true,
          axisLineStyle: AxisLineStyle(
              cornerStyle: CornerStyle.bothFlat,
              dashArray: const [104, 2],
              color: Colors.grey.shade400,
              gradient: SweepGradient(colors: <Color>[
                Colors.pink.shade900,
                Colors.amber.shade700,
                Colors.teal.shade700,
              ], stops: const [
                0,
                0.5,
                1
              ]),
              thickness: 3),
          // useRangeColorForAxis: true,
        ),
        RadialAxis(
            radiusFactor: 1.5,
            axisLabelStyle: const GaugeTextStyle(
              fontSize: 9,
            ),
            majorTickStyle: const MajorTickStyle(
              length: 6,
            ),
            minorTickStyle: const MinorTickStyle(
              length: 3,
            ),
            tickOffset: 2,
            minorTicksPerInterval: 10,
            labelsPosition: ElementsPosition.outside,
            ticksPosition: ElementsPosition.outside,
            // showAxisLine: true,
            showLabels: false,
            showTicks: true,
            canScaleToFit: true,
            minimum: 0,
            maximum: 1000,
            // useRangeColorForAxis: true,
            axisLineStyle: AxisLineStyle(
                cornerStyle: CornerStyle.bothFlat,
                dashArray: const [124, 2],
                color: Colors.grey.shade400,
                gradient: SweepGradient(colors: <Color>[
                  Colors.pink.shade800.withOpacity(0.9),
                  Colors.deepOrange.shade700.withOpacity(0.8),
                  Colors.amber.shade700.withOpacity(0.8),
                  Colors.teal.shade600.withOpacity(0.8),
                ], stops: const [
                  0,
                  0.3,
                  0.6,
                  1
                ]),
                thickness: 25),
            pointers: <GaugePointer>[
              MarkerPointer(
                  value: score.toDouble(),
                  markerHeight: 30,
                  markerWidth: 22,
                  markerOffset: 8,
                  color: Colors.grey.shade800,
                  animationType: AnimationType.easeOutBack,
                  markerType: MarkerType.triangle),
            ],
            endAngle: 30,
            startAngle: 150,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,
                horizontalAlignment: GaugeAlignment.center,
                verticalAlignment: GaugeAlignment.center,
                positionFactor: 0.5,
                widget: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: score.toInt().toString(),
                            style: GoogleFonts.openSans(
                                color: Colors.black87,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '/1000',
                                  style: GoogleFonts.openSans(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.2),
                                  children: const <TextSpan>[])
                            ]),
                      ),
                      Text(
                        '${score > 700 ? 'Low' : score > 350 ? 'Moderate' : 'High'}  ${'Risk'}',
                        style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ]);
}

class CustomDailyPage extends StatelessWidget {
  Data data;
   CustomDailyPage({
    super.key,
    required this.data
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: LeaveApproveCardDecoration.leaveDecoration(
          5, 5,int.parse("${data.pm2cnc}"), Colors.white, Colors.white),
      child: Column(
        children: [
           Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "Date : ",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                Text(
                  "${data.dtTime}",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "Temperature : ",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                Text("${data.temp}°C°F",
                    style: TextStyle(color: Colors.white, fontSize: 14.0))
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                const Text(
                  "PM2.5 cnc : ",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                 Text(
                  "${data.pm2cnc}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  child: Text(
                    "Other data",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
           Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "Station Name : ",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                Text(
                  "${Constants.stationnameHashmap[data.deviceid]}",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tipsa/defis.dart';
import 'package:tipsa/new_feed.dart';
import 'package:tipsa/outils.dart';
import '../social_page.dart';
import '../a_table_page.dart';
import 'extention.dart';
import 'date_time-selector.dart';
import 'package:calendar_view/calendar_view.dart';
import 'event.dart';




class AddEventWidget extends StatefulWidget {
  final void Function(CalendarEventData<Event>)? onEventAdd;

  const AddEventWidget({
    Key? key,
    this.onEventAdd,
  }) : super(key: key);

  @override
  _AddEventWidgetState createState() => _AddEventWidgetState();
}

class _AddEventWidgetState extends State<AddEventWidget> {
  late DateTime _startDate;
  late DateTime _endDate;

  DateTime? _startTime;

  DateTime? _endTime;

  String _title = "";

  String _description = "";

  Color _color = Colors.blue;

  late FocusNode _titleNode;

  late FocusNode _descriptionNode;

  late FocusNode _dateNode;

  final GlobalKey<FormState> _form = GlobalKey();

  late TextEditingController _startDateController ;
  late TextEditingController _startTimeController ;
  late TextEditingController _endTimeController ;
  late TextEditingController _endDateController ;

  @override
  void initState() {
    super.initState();

    _titleNode = FocusNode();
    _descriptionNode = FocusNode();
    _dateNode = FocusNode();

    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _titleNode.dispose();
    _descriptionNode.dispose();
    _dateNode.dispose();

    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      TextFormField(
          decoration: InputDecoration(
      labelText: "Titre",
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 17.0,
      ),
      onSaved: (value) => _title = value?.trim() ?? "",
      validator: (value) {
        if (value == null || value == "")
          return "Please enter event title.";

        return null;
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    ),
    SizedBox(height: 15,),
    Row(
    children: [
    Expanded(
    child: DateTimeSelectorFormField(
    controller: _startDateController,
    decoration: InputDecoration(
    labelText: "Date de d??but ",
    ),
    validator: (value) {
    if (value == null || value == "")
    return "Please select date.";

    return null;
    },
    textStyle: TextStyle(
    color: Colors.black,
    fontSize: 17.0,
    ),
    onSave: (date) => _startDate = date,
    type: DateTimeSelectionType.date,
    ),
    ),
    SizedBox(width: 20.0),
    Expanded(
    child: DateTimeSelectorFormField(
    controller: _endDateController,
    decoration: InputDecoration(
    labelText: "End Date",
    ),
    validator: (value) {
    if (value == null || value == "")
    return "Please select date.";

    return null;
    },
    textStyle: TextStyle(
    color: Colors.black,
    fontSize: 17.0,
    ),
    onSave: (date) => _endDate = date,
    type: DateTimeSelectionType.date,
    ),
    ),
    ],
    ),
    SizedBox(height: 15,),
    Row(
    children: [
    Expanded(
    child: DateTimeSelectorFormField(
    controller: _startTimeController,
    decoration: InputDecoration(
    labelText: "Start Time",
    ),
    validator: (value) {
    if (value == null || value == "")
    return "Please select start time.";

    return null;
    },
    onSave: (date) => _startTime = date,
    textStyle: TextStyle(
    color: Colors.black,
    fontSize: 17.0,
    ),
    type: DateTimeSelectionType.time,
    ),
    ),
          SizedBox(width: 20.0),
          Expanded(
            child: DateTimeSelectorFormField(
              controller: _endTimeController,
              decoration: InputDecoration(
                labelText: "End Time",
              ),
              validator: (value) {
                if (value == null || value == "")
                  return "Please select end time.";

                return null;
              },
              onSave: (date) => _endTime = date,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
              type: DateTimeSelectionType.time,
            ),
          ),
        ],
      ),
      SizedBox(height: 15,),
      TextFormField(
        focusNode: _descriptionNode,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
        ),
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        selectionControls: MaterialTextSelectionControls(),
        minLines: 1,
        maxLines: 10,
        maxLength: 1000,
        validator: (value) {
          if (value == null || value.trim() == "")
            return "Please enter event description.";

          return null;
        },
        onSaved: (value) => _description = value?.trim() ?? "",
        decoration: InputDecoration(
          hintText: "Event Description",
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        children: [
          Text(
            "Event Color: ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: _displayColorPicker,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: _color,
            ),
          ),
        ],
      ),
      SizedBox(height: 15,),
      TextButton(
        onPressed: () { _createEvent;
        },
        child: const Text('Ajout?? Event',
        style: TextStyle(
          backgroundColor : Colors.blue,
          color: Colors.white,
    ) ,),
      )
    ],
    ),
    );
  }
    void _createEvent() {
    if (!(_form.currentState?.validate() ?? true)) return;

    _form.currentState?.save();

    final event = CalendarEventData<Event>(
    date: _startDate,
    color: _color,
    endTime: _endTime,
    startTime: _startTime,
    description: _description,
    endDate: _endDate,
    title: _title,
    event: Event(
    title: _title,
    ),
    );

    widget.onEventAdd?.call(event);
    _resetForm();
    }

    void _resetForm() {
    _form.currentState?.reset();
    _startDateController.text = "";
    _endTimeController.text = "";
    _startTimeController.text = "";
    }

    void _displayColorPicker() {
    var color = _color;
    showDialog(
    context: context,
    useSafeArea: true,
    barrierColor: Colors.black26,
    builder: (_) => SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    side: BorderSide(
    color: Colors.blueGrey,
    width: 2,
    ),
    ),
    contentPadding: EdgeInsets.all(20.0),
    children: [
    Text(
    "Event Color",
    style: TextStyle(
    color: Colors.black,
    fontSize: 25.0,
    ),
    ),
    Container(
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    height: 1.0,
    color: Colors.blueGrey,
    ),
    ColorPicker(
    displayThumbColor: true,
    enableAlpha: false,
    pickerColor: _color,
    onColorChanged: (c) {
    color = c;
    },
    ),
    Center(
    child: Padding(
    padding: EdgeInsets.only(top: 50.0, bottom: 30.0),
    child: TextButton(
      child: const Text('Ajout?? Event'),
      onPressed: () {
     if (mounted) setState(() {_color = color;}
        );
      context.pop();
        },
      ),
    ),
    ),
    ],
    ),
    );
  }
}

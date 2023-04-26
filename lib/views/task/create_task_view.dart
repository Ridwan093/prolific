import 'dart:io';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:get_it/get_it.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:prolific/lib/managers/organization_manager.dart';
import 'package:prolific/lib/managers/task_manager.dart';
import 'package:prolific/lib/models/member.dart';
import 'package:prolific/lib/models/organization.dart' as org;
import 'package:prolific/lib/utils/ui_utils/custom_colors.dart';
import 'package:prolific/lib/utils/ui_utils/ui_utils.dart';
import 'package:prolific/lib/views/task/components/task_assignee_widget.dart';

class CreateNewTaskView extends StatefulWidget {
  const CreateNewTaskView({Key? key}) : super(key: key);

  @override
  State<CreateNewTaskView> createState() => _CreateNewTaskViewState();
}

class _CreateNewTaskViewState extends State<CreateNewTaskView> {
  final OrganizationManager _organizationManager =
      GetIt.I.get<OrganizationManager>();
  final TaskManager _taskManager = GetIt.I.get<TaskManager>();
  final UiUtilities uiUtilities = UiUtilities();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode taskFocusNode = FocusNode();
  bool isSwitched = false;
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final TextEditingController dueDateTextEditingController =
      TextEditingController();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  late DateTime dueDate;
  String? teamTextEditingController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/', arguments: 1);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: customRedColor,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: BackButton(
            color: Colors.white,
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/', arguments: 1),
          ),
          title: Text(
            'New Task',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'What needs to be done ?',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: descriptionTextEditingController,
                focusNode: taskFocusNode,
                style: Theme.of(context).textTheme.bodyText1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 4,
                cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                    filled: false,
                    hintText: 'Start Typing ...',
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: customGreyColor)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: customGreyColor)),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field cannot be Empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'By when ?',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Due date & time',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.normal, color: customGreyColor),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  await pickDateTime(context);
                },
                child: TextFormField(
                  onTap: () async {
                    await pickDateTime(context);
                  },
                  controller: dueDateTextEditingController,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w600),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.datetime,
                  maxLines: 1,
                  cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                      filled: false,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: customGreyColor)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: customGreyColor)),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                      suffixIcon: const Icon(
                        Icons.arrow_forward,
                        color: customGreyColor,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be Empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Which team?',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<org.Organization?>(
                  future: _organizationManager.getOrganization(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        !snapshot.hasData) {
                      return OutlineDropdownButton(
                        value: teamTextEditingController,
                        inputDecoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: customGreyColor),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 1, 15, 1),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder,
                          enabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .enabledBorder,
                          disabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .disabledBorder,
                          errorBorder: Theme.of(context)
                              .inputDecorationTheme
                              .errorBorder,
                          focusedErrorBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedErrorBorder,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          filled: true,
                          labelStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          errorStyle:
                              Theme.of(context).inputDecorationTheme.errorStyle,
                        ),
                        items: const [],
                        hint: Text(
                          'Select your team',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        onChanged: (value) {},
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data == null) {
                      return OutlineDropdownButton(
                        value: teamTextEditingController,
                        inputDecoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: customGreyColor),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 1, 15, 1),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder,
                          enabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .enabledBorder,
                          disabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .disabledBorder,
                          errorBorder: Theme.of(context)
                              .inputDecorationTheme
                              .errorBorder,
                          focusedErrorBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedErrorBorder,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          filled: true,
                          labelStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          errorStyle:
                              Theme.of(context).inputDecorationTheme.errorStyle,
                        ),
                        items: const [],
                        hint: Text(
                          'Select your team',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        onChanged: (value) {},
                      );
                    }

                    return OutlineDropdownButton(
                      inputDecoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(
                                fontWeight: FontWeight.normal,
                                color: customGreyColor),
                        contentPadding: const EdgeInsets.fromLTRB(15, 1, 15, 1),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        focusedBorder: Theme.of(context)
                            .inputDecorationTheme
                            .focusedBorder,
                        enabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        disabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .disabledBorder,
                        errorBorder:
                            Theme.of(context).inputDecorationTheme.errorBorder,
                        focusedErrorBorder: Theme.of(context)
                            .inputDecorationTheme
                            .focusedErrorBorder,
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        filled: true,
                        labelStyle:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                        errorStyle:
                            Theme.of(context).inputDecorationTheme.errorStyle,
                      ),
                      items: snapshot.data!.data!.teams!
                          .map((value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context).textTheme.bodyText1,
                              )))
                          .toList(),
                      value: teamTextEditingController,
                      hint: Text(
                        'Select your team',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onChanged: (value) {
                        setState(() {
                          teamTextEditingController = value;
                        });
                      },
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Set task reminder',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Switch.adaptive(
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    value: isSwitched,
                    activeColor: customRedColor,
                    activeTrackColor: customRedColor.withOpacity(.5),
                    inactiveThumbColor: customGreyColor,
                    inactiveTrackColor: customGreyColor,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'By whom ?',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'select Assignee',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.normal, color: customGreyColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  _taskManager.assignees.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FlutterImageStack(
                            imageList: _taskManager.assignees
                                .map((e) => e.picture)
                                .toList() as List<String>,
                            extraCountTextStyle:
                                Theme.of(context).textTheme.subtitle2!,
                            itemBorderColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            itemRadius: 50,
                            itemCount: _taskManager.assignees.length,
                            itemBorderWidth: 1,
                            showTotalCount: true,
                            backgroundColor: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)]
                                .withOpacity(.5),
                            totalCount: _taskManager.assignees.length - 1,
                          ),
                        )
                      : const SizedBox.shrink(),
                  FutureBuilder<Member?>(
                      future: _organizationManager.getOrganizationMembers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            !snapshot.hasData) {
                          return const CupertinoActivityIndicator();
                        }
                        if (snapshot.connectionState == ConnectionState.done &&
                            !snapshot.hasData) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: DottedBorder(
                              borderType: BorderType.Circle,
                              radius: const Radius.circular(6),
                              color: customGreyColor,
                              dashPattern: const [6, 3, 6, 3],
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(45)),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  color: customGreyColor.withOpacity(.2),
                                  child: const Center(
                                      child: Icon(
                                    MaterialIcons.person_add,
                                    color: customGreyColor,
                                  )),
                                ),
                              ),
                            ),
                          );
                        }

                        return GestureDetector(
                          onTap: () async {
                            if (Platform.isIOS) {
                              showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return TaskAssigneeWidget(
                                    taskManager: _taskManager,
                                    data: snapshot.data,
                                  );
                                },
                              ).then((_) => setState(() {}));
                            } else {
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return TaskAssigneeWidget(
                                    taskManager: _taskManager,
                                    data: snapshot.data,
                                  );
                                },
                              ).then((_) => setState(() {}));
                            }
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DottedBorder(
                              borderType: BorderType.Circle,
                              radius: const Radius.circular(6),
                              color: customGreyColor,
                              dashPattern: const [6, 3, 6, 3],
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(45)),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  color: customGreyColor.withOpacity(.2),
                                  child: const Center(
                                      child: Icon(
                                    MaterialIcons.person_add,
                                    color: customGreyColor,
                                  )),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
              const SizedBox(height: 25),
              TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.black),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    BotToast.showLoading(
                        allowClick: false,
                        clickClose: false,
                        backButtonBehavior: BackButtonBehavior.ignore);
                    List<int?> userIds = [];
                    for (var element in _taskManager.assignees) {
                      userIds.add(element.id);
                    }

                    bool isSaved = await _taskManager.createTask(
                      team: teamTextEditingController,
                      description: descriptionTextEditingController.text,
                      dueDate: dueDateTextEditingController.text,
                      shouldSetReminder: isSwitched,
                      assignees: userIds,
                    );
                    BotToast.closeAllLoading();
                    if (isSaved) {
                      uiUtilities.actionAlertWidget(
                          context: context, alertType: 'success');
                      uiUtilities.alertNotification(
                          context: context, message: _taskManager.message!);

                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.pushReplacementNamed(context, '/',
                            arguments: 1);
                      });
                    } else {
                      uiUtilities.actionAlertWidget(
                          context: context, alertType: 'error');
                      uiUtilities.alertNotification(
                          context: context, message: _taskManager.message!);
                    }
                  } else {
                    uiUtilities.actionAlertWidget(
                        context: context, alertType: 'error');
                    uiUtilities.alertNotification(
                        context: context, message: 'Fields cannot be empty');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Create Task',
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  pickDateTime(BuildContext context) async {
    if (Platform.isIOS) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (picked) {
                  setState(() {
                    dueDate = picked;
                    dueDateTextEditingController.text =
                        dateFormat.format(dueDate);
                  });
                },
                initialDateTime: DateTime.now(),
                minimumYear: DateTime.now().year,
                maximumYear: 2030,
              ),
            );
          });
    } else {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        helpText: 'Select due date',
      );
      if (picked != null) {
        TimeOfDay? timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          helpText: 'Select due time',
        );

        if (timeOfDay != null) {
          setState(() {
            dueDate = DateTime(picked.year, picked.month, picked.day,
                timeOfDay.hour, timeOfDay.minute);
            dueDateTextEditingController.text = dateFormat.format(dueDate);
          });
        }
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'package:get/get.dart';
import 'package:hire_me/widgets/form/checkbox.dart';

import '../../widgets/form/radio.dart';
import '../../models/controllers/formController.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:hire_me/widgets/sharedWidgets/myDrawer.dart';

class FormPage extends GetView<FormController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Get.lazyPut(() => FormController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(HomePage());
            },
            icon: Icon(Icons.home),
          )
        ],
        centerTitle: true,
        title: Text('Form 2nd FCC Project',
            style: Theme.of(context).textTheme.headline1),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
              ? EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.2,
                )
              : EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.025,
              ),
              // ------ TITLE --------- //
              Text('What do you need?',
                  style: Theme.of(context).textTheme.headline2),
              // ------ SUB TITLE --------- //
              Text(
                'We will get in touch with you as soon as possible.',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              // ------- FORM CONTAINER --------- //
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.035,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.035,
                ),
                color: Colors.grey[100],
                child: Column(
                  children: [
                    // ------ NAME INPUT ----------- //
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      controller: controller.nameController,
                      onSaved: (value) {
                        controller.name = value!;
                      },
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // ------ EMAIL INPUT ----------- //
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // ------ AGE INPUT ----------- //
                    TextFormField(
                      controller: controller.ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: '(Optional) Enter your age',
                        prefixIcon: Icon(Icons.timelapse),
                      ),
                      onSaved: (value) {
                        controller.age = value!;
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // ------ DROPDOWN INPUT ----------- //
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'What of these products is similar to what you need?',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Obx(
                      () => DropdownButton(
                        value: controller.selectedDropdown.value,
                        onChanged: (newValue) {
                          controller.setSelected(newValue as String);
                          // controller.selectedDropdown = newValue! as RxString;
                          // controller.update();
                        },
                        items: controller.dropdownTextList.map((selected) {
                          return DropdownMenuItem(
                            value: selected,
                            child: new Text(
                              selected,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // ------ RADIO INPUT ----------- //
                    Text(
                      'When do you need this?',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    MyRadio(),

                    // ------ CHECK INPUT ----------- //
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'What features do you need?',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      child: Column(children: [
                        ListTile(
                          leading: MyCheckBox(),
                          title: Text('User Accounts / Authentication'),
                        ),
                        ListTile(
                          leading: MyCheckBox(),
                          title: Text('Database'),
                        ),
                        ListTile(
                          leading: MyCheckBox(),
                          title: Text('GPS'),
                        ),
                        ListTile(
                          leading: MyCheckBox(),
                          title: Text('Chat'),
                        ),
                      ]),
                    ),
                    // ------ TEXT AREA INPUT ----------- //
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      expands: false,
                      minLines: 2,
                      maxLines: 5,
                      controller: controller.textAreaController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'I want my app ...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: '(Optional) Enter your details',
                        prefixIcon: Icon(Icons.text_fields),
                      ),
                      onSaved: (value) {
                        controller.text = value!;
                      },
                    ),
                    // ------ SUBMIT INPUT BUTTON ----------- //
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: width * 0.5),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.checkForm();
                        },
                        child: Text('Submit'),
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: 0,
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

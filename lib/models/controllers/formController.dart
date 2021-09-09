import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      ageController,
      dropDownController,
      textAreaController;
  var name = '';
  var email = '';
  var age = '';
  var selectedDropdown = 'Blog'.obs;
  var text = 'Tell us any detail that we could be missing';

  List dropdownTextList = ['Blog', 'Ecommerce', 'Social Media', 'Other'];

  void setSelected(String value) {
    selectedDropdown.value = value;
  }

  var urgency = 'Now'.obs;
  List<String> speed = ['Now', 'In the next months', 'I can wait'];

  set selectedUrgency(String selectedUrgency) {
    urgency.value = selectedUrgency;
    // urgency.update((urgency) {
    //   speed!.selectedUrgency = selectedUrgency;
  }

  String get selectedUrgency => urgency.value;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    ageController = TextEditingController();
    dropDownController = TextEditingController();
    textAreaController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    dropDownController.dispose();
    textAreaController.dispose();
    super.onClose();
  }

  void dependencies() {
    Get.lazyPut(() => FormController());
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? validateName(String value) {
    if (value.length < 2) {
      return 'Enter your name';
    } else {
      return null;
    }
  }

  void checkForm() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      Get.snackbar('Oops!', 'Please fill the needed inputs');
      return;
    } else {
      formKey.currentState!.save();
      Get.snackbar(
          'Message sent!', 'Thanks for contacting us, we will reply shortly');
    }
  }

  // void submit() {
  //   if (formKey.currentState!.validate()) {
  //     checkForm(nameController.text, emailController.text).then((input) {
  //       if (input) {
  //         Get.snackbar('Message sent!',
  //             'Thanks for contacting us, we will reply shortly');
  //       } else {
  //         Get.snackbar('Oops!', 'Please fill the needed inputs');
  //       }
  //     });
  //   }
  // }

  // Future<bool> checkForm(String name, String email) {
  //   if (nameController.text != null && emailController != null) {
  //     return Future.value(true);
  //   }
  //   return Future.value(false);
  // }
}

import 'package:get/get.dart';
import 'package:rail_ticketing/models/gst_model.dart';

class GstViewmodel extends GetxController {
  GstModel gstModel = GstModel();

  Map<String, dynamic> getGstData() {
    return {'gstIn': gstModel.gstIn};
  }
}

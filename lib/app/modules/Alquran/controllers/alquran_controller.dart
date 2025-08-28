import 'package:belajar_getx/app/data/models/alquran.dart';
import 'package:belajar_getx/app/service/alquran_service.dart';
import 'package:get/get.dart';


class AlQuranController extends GetxController {
   final QuranService QuranApi = Get.put<QuranService>(QuranService());

  RxList qurans = <Quran>[].obs; 
  RxBool isLoading = true.obs; 
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQurans();
  }

  void fetchQurans() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await QuranApi.fetchQurans();

      if (response.statusCode == 200) {
        final data = (response.body as List)
            .map((e) => Quran.fromJson(e))
            .toList();
        qurans.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
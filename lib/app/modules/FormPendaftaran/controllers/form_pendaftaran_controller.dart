import 'package:belajar_getx/app/modules/FormPendaftaran/views/result_screen_view.dart';
import 'package:get/get.dart';

class FormPendaftaranController extends GetxController {
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfbirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  RxString namaError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfbirthError = ''.obs;
  RxString phoneError = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void validateName({required String name}) {
    if (name.length < 3) {
      namaError.value = "Nama Minimal 3 Karakter";
    } else {
      namaError.value = '';
    }
  }

  void validateGender({required String? jenisKelamin}) {
    if (jenisKelamin == null || jenisKelamin.isEmpty) {
      genderError.value = 'Pilih Jenis Kelamin';
    } else {
      genderError.value = '';
    }
  }

  void validateDateOfBirth({required DateTime? tanggalLahir}) {
    if (tanggalLahir == null) {
      dateOfbirthError.value = 'Pilih Tanggal Lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - tanggalLahir.year;
      if (age < 2) {
        dateOfbirthError.value = 'Umur minimal 2 tahun';
      } else {
        dateOfbirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor Telepon Tidak Valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(jenisKelamin: gender.value);
    validateDateOfBirth(tanggalLahir: dateOfbirth.value);
    validatePhone(phone: phone.value);

    if (namaError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfbirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      Get.to(
         () => ResultScreenView (
          name : name.value,
          gender:  gender.value,
          dateOfbirth: dateOfbirth.value!.toString(),
          phone: phone.value,
         )
         
        ,
      );
    } else {}
  }
}


void main() {
  //a) veri tipleri 
  int yas = 21;
  String ad = "Sinem";
  double sicaklik = 36.6;
  bool aktifMi = true;
  dynamic degisken = "Bu bir metin";
  String karakter = 'S';

  // değişkenleri yazdırma
  print("Yaş: $yas");
  print("Ad: $ad");
  print("Sıcaklık: $sicaklik");
  print("Aktif mi: $aktifMi");
  print("Dinamik Değişken: $degisken");
  print("Karakter: $karakter");

  // b) 3 tane değişkeni tekrar tanımlama 
  // CamelCase
  int yasim = 25;
  print("Yasim: $yasim");

  //  snake_case
  String soy_ad = "Aykar";
  print("Soy ad: $soy_ad");

  //  Pascalcase
  double SicaklikDegeri = 36.6;
  print("Sicaklik Degeri: $SicaklikDegeri");

  // c. Ad, soyad, yaş ve reşitlik durumunu konsola bastırma
  String isim = "Sinem";
  String soyad = "Şafak";
  int yasim2 = 21;
  bool resitMi = true;

  print("ben $isim $soyad, yaşım $yasim2 benim reşitlik durumum $resitMi");
}




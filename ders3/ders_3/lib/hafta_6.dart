import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp widget'ı StatefulWidget'dan türetilmiş, yani durumu değişebilir
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// _MyAppState sınıfı, MyApp widget'ının durumunu yönetiyor
class _MyAppState extends State<MyApp> {
  // Form anahtarı, formun doğrulamasını yönetmek için kullanılıyor
  final _formKey = GlobalKey<FormState>();

  // TextEditingController, metin alanının değerini almak için kullanılıyor
  TextEditingController nameController = TextEditingController();

  // Cinsiyet seçimi için değişken ayarladım
  String? selectedGender;

  // Reşit olup olmadığını tutan değişkeni ayarladım
  bool? isAdult = false;

  // Sigara kullanıp kullanmadığını tutan değişkeni ayarladım
  bool isSmoker = false;

  // Günlük sigara sayısını tutan değişkeni ayarladım
  double cigaretteCount = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı gizler
      title: 'Kişilik Anketi', // Uygulamanın başlığı
      home: SafeArea( // ekran çentikleri için
        child: Scaffold(
          backgroundColor: Colors.white, // Arka plan rengi beyaz
          appBar: AppBar(
            backgroundColor: Colors.orange, // Uygulama çubuğunun arka plan rengi turuncu
            title: Text(
              "Kişilik Anketi",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true, // Başlığı ortalamak için
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0), // İçerik etrafına boşluk ekler
            child: Form(
              key: _formKey, // Form anahtarını bağlamak için
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Çocuk widget'ları sola hizalar
                children: [
                  TextFormField(
                    controller: nameController, // TextEditingController ile bağlanır
                    decoration: InputDecoration(
                      labelText: 'Adınız ve Soyadınız',
                      border: OutlineInputBorder(), // Kenarlık ekler
                    ),
                  ),
                  SizedBox(height: 16), // Dikey boşluk ekler
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Cinsiyetinizi Seçiniz',
                      border: OutlineInputBorder(), // Kenarlık ekler
                    ),
                    value: selectedGender, // Seçili cinsiyeti bağlar
                    items: <String>['Erkek', 'Kadın', 'Diğer']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), // Dropdown menüsünü oluşturur
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue; // Seçili cinsiyeti günceller
                      });
                    },
                  ),
                  SizedBox(height: 16), // Dikey boşluk ekler
                  CheckboxListTile(
                    title: Text('Reşit misiniz?'),
                    value: isAdult, // Checkbox durumunu bağlar
                    onChanged: (bool? newValue) {
                      setState(() {
                        isAdult = newValue; // Reşit olma durumunu günceller
                      });
                    },
                  ),
                  SizedBox(height: 16), // Dikey boşluk ekler
                  SwitchListTile(
                    title: Text('Sigara kullanıyor musunuz?'),
                    value: isSmoker, // Switch durumunu bağlar
                    onChanged: (bool newValue) {
                      setState(() {
                        isSmoker = newValue; // Sigara kullanma durumunu günceller
                      });
                    },
                  ),
                  if (isSmoker) // Eğer sigara kullanıyorsa slider göstermek için
                    Column(
                      children: [
                        Text('Günde kaç tane sigara kullanıyorsunuz?'),
                        Slider(
                          value: cigaretteCount, // Slider değerini bağlar
                          onChanged: (double value) {
                            setState(() {
                              cigaretteCount = value; // Sigara sayısını günceller
                            });
                          },
                          min: 0,
                          max: 40,
                          divisions: 40, // Slider için bölümler eklemek için 
                          label: cigaretteCount.round().toString(), // Etiket
                        ),
                      ],
                    ),
                  SizedBox(height: 16), // Dikey boşluk ekler
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form doğrulanırsa dialog gösterir
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  'Adınız ve Soyadınız: ${nameController.text}\n'
                                      'Cinsiyet: ${selectedGender ?? ''}\n'
                                      'Reşit: ${isAdult == true ? 'Evet' : 'Hayır'}\n'
                                      'Sigara: ${isSmoker ? 'Evet' : 'Hayır'}\n'
                                      '${isSmoker ? 'Günde sigara sayısı: ${cigaretteCount.round()}' : ''}',
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text('Bilgileri Gönder'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

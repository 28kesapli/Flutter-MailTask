// Yakup sagır 244602035 mobil programlama final odevi
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Hocanın istedigi onay kodu degiskeni
  static const String _ogrenciOnayKodu = "MOBIL2026";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow Portal v1.0',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Aktif sekmeyi tutan degisken

  // Bildirim sekmesindeki sahte veriler belediye stajı bilgisi yok
  final List<Map<String, dynamic>> bildirimler = [
    {
      'baslik': 'Sistem Altyapı Yönetimi',
      'detay': 'Sunucu optimizasyon çalışmaları bu gece saat 02:00 itibarıyla başlayacaktır Lütfen aktif çalışmalarınızı kaydedip paneli kapatınız',
      'renk': const Color(0xFFE53935),
      'ikon': Icons.dns_rounded,
      'saat': '10:45'
    },
    {
      'baslik': 'İnsan Kaynakları Koordinatörlüğü',
      'detay': 'Yaz dönemi zorunlu ve isteğe bağlı staj sigorta giriş dökümanları portal üzerinden dijital onayınıza sunulmuştur Son gün Cuma',
      'renk': const Color(0xFF1E88E5),
      'ikon': Icons.people_alt_rounded,
      'saat': 'Dün'
    },
    {
      'baslik': 'GitHub Enterprise Server',
      'detay': 'ProjeDepo mobil_app ana reposuna yeni bir kod entegrasyonu pull request gönderildi Kıdemli geliştirici incelemesi bekleniyor',
      'renk': Colors.black87,
      'ikon': Icons.terminal_rounded,
      'saat': '2 gün önce'
    },
    {
      'baslik': 'Teknoloji Eğitim Akademisi',
      'detay': 'Flutter ile İleri Seviye Eyalet Yönetimi State Management ve Clean Architecture eğitimi kullanıcı profilinize başarıyla tanımlanmıştır',
      'renk': const Color(0xFF43A047),
      'ikon': Icons.school_rounded,
      'saat': '3 gün önce'
    },
    {
      'baslik': 'Mali ve Finansal İşler Birimi',
      'detay': 'Haziran ayı kurumsal yemek kartı ödenekleri ve yan hak bakiyeleri personel hesaplarına aktarılmıştır İyi günlerde harcayınız',
      'renk': const Color(0xFFFFB300),
      'ikon': Icons.account_balance_wallet_rounded,
      'saat': 'Geçen hafta'
    },
  ];

  // Gorevler sekmesindeki sahte veriler
  final List<Map<String, dynamic>> gorevler = [
    {
      'is': 'Mobil application kullanıcı arayüz testleri farklı ekran çözünürlüğündeki test cihazlarında denenecek ve dökümante edilecek',
      'oncelik': 'Yüksek',
      'renk': const Color(0xFFE53935)
    },
    {
      'is': 'SQL Server ilişkisel veritabanı üzerinde indeksleme sorgu optimizasyonu ve log temizleme işleri yapılarak yedek alınacak',
      'oncelik': 'Orta',
      'renk': const Color(0xFFFFB300)
    },
    {
      'is': 'Merkezi sanal makine mimarisi üzerindeki Docker container imajları en son kararlı sürümlere güncellenecek',
      'oncelik': 'Düşük',
      'renk': const Color(0xFF43A047)
    },
    {
      'is': 'Sistem odası ağ kablolaması sonrasında omurga switch konfigürasyonları ve port güvenlik ayarları kontrol edilecek',
      'oncelik': 'Yüksek',
      'renk': const Color(0xFFE53935)
    },
    {
      'is': 'Son kullanıcılar için hazırlanan sistem entegrasyon kullanım kılavuzu dökümantasyonu PDF formatında hazır hale getirilecek',
      'oncelik': 'Düşük',
      'renk': const Color(0xFF43A047)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ust bar alanı yani appbar kısmı
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A237E), // Koyu gece mavisi rengi
        elevation: 3,
        shadowColor: Colors.black26,
        automaticallyImplyLeading: false,
        leading: _currentIndex == 0 ? Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.notes_rounded, color: Colors.white, size: 26),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ) : null,
        title: _currentIndex == 0 
          ? const Text('Kurumsal Bildirim Merkezi', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5))
          : Row(
              children: [
                const Icon(Icons.fact_check_rounded, color: Colors.white, size: 26),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Aktif Görev Havuzu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 2),
                    Text('Genel Tamamlama Oranı: %0', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w400)),
                  ],
                )
              ],
            ),
      ),

      // Sol acılır menu yani drawer kısmı
      drawer: Drawer(
        elevation: 5,
        child: Container(
          color: const Color(0xFFF4F6F9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 20, bottom: 24, right: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFF1A237E),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(36)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFFFB300),
                      child: Icon(Icons.person_pin_rounded, color: Color(0xFF1A237E), size: 36),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Yakup Sağır',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19, letterSpacing: 0.5),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Öğrenci No: 244602035',
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: AbsorbPointer(
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.notification_important_rounded, color: Color(0xFF1A237E)),
                        title: Text('Sistem Duyuruları', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                      ),
                      Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: Icon(Icons.archive_outlined, color: Colors.black54),
                        title: Text('Arşivlenmiş Bildirimler', style: TextStyle(color: Colors.black54)),
                      ),
                      ListTile(
                        leading: Icon(Icons.star_border_rounded, color: Colors.black54),
                        title: Text('Yıldızlı Görevler', style: TextStyle(color: Colors.black54)),
                      ),
                      ListTile(
                        leading: Icon(Icons.analytics_outlined, color: Colors.black54),
                        title: Text('Performans İstatistikleri', style: TextStyle(color: Colors.black54)),
                      ),
                      Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: Icon(Icons.settings_suggest_rounded, color: Colors.black54),
                        title: Text('Portal Ayarları', style: TextStyle(color: Colors.black54)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Alt menuden secilen sekmeyi ekrana basan yer
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildBildirimSekmesi(),
          _buildGorevlerSekmesi(),
        ],
      ),

      // Sag alttaki arti butonu yani fab
      floatingActionButton: AbsorbPointer(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFFFFB300), // Sarı renkli buton
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(Icons.add_rounded, color: Color(0xFF1A237E), size: 30),
        ),
      ),

      // Alt menu kısmı yani bottom navigation bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF1A237E),
          unselectedItemColor: Colors.black38,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.notifications_active_outlined)),
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.notifications_active)),
              label: 'Bildirimler',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.playlist_add_check_rounded)),
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.playlist_add_check)),
              label: 'Görevler',
            ),
          ],
        ),
      ),
    );
  }

  // Bildirim listesini olusturan metod
  Widget _buildBildirimSekmesi() {
    return Column(
      children: [
        AbsorbPointer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 0.8),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Icon(Icons.search_rounded, color: Colors.black45),
                  ),
                  Text(
                    'Gelen bildirimlerde ara...',
                    style: TextStyle(color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: bildirimler.length,
            separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFE0E0E0)),
            itemBuilder: (context, index) {
              final item = bildirimler[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: item['renk'].withOpacity(0.12),
                    child: Icon(item['ikon'], color: item['renk'], size: 22),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['baslik'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 15)),
                      Text(item['saat'], style: const TextStyle(color: Colors.black38, fontSize: 11)),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      item['detay'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.3),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Gorev listesini olusturan metod
  Widget _buildGorevlerSekmesi() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      itemCount: gorevler.length,
      itemBuilder: (context, index) {
        final item = gorevler[index];
        return Card(
          color: Colors.white,
          elevation: 0.5,
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xFFEEEEEE), width: 0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: ListTile(
              leading: Container(
                width: 5,
                height: 40,
                decoration: BoxDecoration(
                  color: item['renk'],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              title: Text(
                item['is'],
                style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500, height: 1.4),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: item['renk'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item['oncelik'],
                  style: TextStyle(color: item['renk'], fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.3),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Kilavuz son sayfa kontrol listesi zorunlulugu olan alan hoca buraya bakıyor
// Bu uygulama Mobil Programlama dersi kapsamında geliştirilmiştir
import 'package:flutter/material.dart';

void main() {
  // Menjalankan aplikasi Flutter utama
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur konfigurasi utama aplikasi
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Aplikasi Absensi Login',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Menentukan tema warna dasar
      ),
      home: const LoginPage(), // Halaman awal aplikasi adalah LoginPage
    );
  }
}

// ---------------------------------------------------------------------------
// 1. HALAMAN LOGIN (STATEFULWIDGET)
// ---------------------------------------------------------------------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk mengambil inputan username
  final TextEditingController _usernameController = TextEditingController();
  
  // Controller untuk mengambil inputan password
  final TextEditingController _passwordController = TextEditingController();

  // Pesan error jika terjadi kesalahan saat login
  String _errorMessage = '';

  // Fungsi untuk menangani proses login
  void _handleLogin() {
    // Ambil nilai teks dari inputan username dan password
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // a. Kalau username / password kosong, tidak bisa routing (tampilkan pesan)
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Username dan password tidak boleh kosong!';
      });
      return;
    }

    // b. Kalau username = admin dan password = 12345
    if (username == 'admin' && password == '12345') {
      setState(() {
        _errorMessage = ''; // Hapus pesan error jika ada
      });

      // Pindah ke homepage dan tidak bisa kembali ke halaman login (pushReplacement)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Jika username atau password tidak sesuai
      setState(() {
        _errorMessage = 'Username atau password salah!';
      });
    }
  }

  @override
  void dispose() {
    // Membersihkan controller agar tidak membebankan memori
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur latar belakang halaman login
      backgroundColor: const Color.fromARGB(225, 236, 125, 190),
      appBar: AppBar(
        // Judul AppBar
        title: const Text("Login Absensi"),
        backgroundColor: const Color.fromARGB(255, 180, 50, 120),
      ),
      body: Center(
        // Widget pembungkus agar bisa di-scroll pada layar kecil
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // d. Memasukkan gambar dari asset/img/ui ux.png
              Image.asset(
                'asset/img/ui ux.png',
                height: 120,
                fit: BoxFit.contain,
                // Handler jika gambar belum diimport / file belum dipasang
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  );
                },
              ),
              const SizedBox(height: 20),

              // Wadah inputan (Container)
              Container(
                width: 320,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(197, 220, 155, 155), // Warna background container
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Input TextField Username
                    TextField(
                      controller: _usernameController, // Menghubungkan ke controller username
                      decoration: const InputDecoration(
                        // c. Icon harus muncul
                        prefixIcon: Icon(Icons.person), // Icon pengguna
                        hintText: 'Masukkan Username',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Input TextField Password
                    TextField(
                      controller: _passwordController, // Menghubungkan ke controller password
                      obscureText: true, // Menyembunyikan karakter password
                      decoration: const InputDecoration(
                        // c. Icon harus muncul
                        prefixIcon: Icon(Icons.lock), // Icon kunci password
                        hintText: 'Masukkan Password',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Menampilkan teks error jika ada kesalahan
                    if (_errorMessage.isNotEmpty)
                      Text(
                        _errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Login
              ElevatedButton.icon(
                onPressed: _handleLogin, // Memanggil fungsi validasi login saat ditekan
                // c. Icon harus muncul pada tombol
                icon: const Icon(Icons.login),
                label: const Text("Masuk"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 2. HALAMAN HOMEPAGE
// ---------------------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar Halaman Utama
      appBar: AppBar(
        title: const Text("absensi - Home"),
        backgroundColor: const Color.fromARGB(255, 180, 50, 120),
        automaticallyImplyLeading: false, // Menghilangkan tombol back agar tidak bisa kembali ke Login
      ),
      backgroundColor: const Color.fromARGB(225, 236, 125, 190),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // c. Icon sukses di HomePage
            const Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            const Text(
              "Selamat Datang di Homepage Admin!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
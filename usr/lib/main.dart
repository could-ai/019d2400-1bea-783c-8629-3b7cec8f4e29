import 'package:flutter/material.dart';

void main() {
  runApp(const AnTraApp());
}

class AnTraApp extends StatelessWidget {
  const AnTraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'An Trà',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // Màu xanh lá cây đậm mang cảm giác thiên nhiên
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Georgia', // Sử dụng font có chân tạo cảm giác cổ điển, thanh lịch (nếu có)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AnTraIntroScreen(),
      },
    );
  }
}

class AnTraIntroScreen extends StatelessWidget {
  const AnTraIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0), // Màu nền hơi ngả vàng nhẹ của giấy/trà
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF2E7D32),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'An Trà',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1597481499750-3e6b22637e12?q=80&w=1000&auto=format&fit=crop',
                    fit: BoxFit.cover,
                  ),
                  // Lớp phủ mờ để chữ dễ đọc hơn
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Bình yên đọng lại trong từng tách trà',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildSection(
                    context,
                    icon: Icons.spa_outlined,
                    title: 'Câu chuyện của An',
                    content:
                        'Giữa nhịp sống hối hả và ồn ào, "An Trà" ra đời với mong muốn mang đến cho bạn một khoảng lặng an yên, một góc nhỏ để tâm hồn được thảnh thơi và thư giãn. Chữ "An" không chỉ là sự an toàn, thuần khiết trong từng búp trà non, mà còn là sự "an yên" trong tâm trí khi bạn nhâm nhi từng ngụm trà ấm nóng.',
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    context,
                    icon: Icons.eco_outlined,
                    title: 'Tinh hoa từ thiên nhiên',
                    content:
                        'Mỗi sản phẩm của An Trà là sự kết tinh của đất trời, được tuyển chọn khắt khe từ những vùng chè trứ danh trên núi cao. Chúng tôi cam kết giữ trọn vẹn hương vị mộc mạc, thanh tao và tự nhiên nhất, không hóa chất, không tẩm ướp hương liệu nhân tạo.',
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    context,
                    icon: Icons.coffee_outlined,
                    title: 'Trải nghiệm trọn vẹn',
                    content:
                        'Dù bạn cần một chút tỉnh táo để bắt đầu ngày mới tràn đầy năng lượng, hay một phút giây tĩnh lặng để khép lại một ngày dài bộn bề, An Trà luôn sẵn sàng đồng hành cùng bạn. Hãy nhắm mắt lại, hít hà hương thơm dịu nhẹ và để vị ngọt hậu lan tỏa.',
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Chào mừng bạn đến với thế giới của An Trà!'),
                          backgroundColor: Color(0xFF2E7D32),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Khám Phá Sản Phẩm',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required IconData icon, required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: const Color(0xFF4CAF50)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agência de Marketing - Assessoria para Marketplaces',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A2540),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A2540),
          primary: const Color(0xFF0A2540),
          secondary: const Color(0xFF42A5F5), // Blue accent
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF0A2540)),
          headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Color(0xFF0A2540)),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87, height: 1.5),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF635BFF), // A vibrant purple for CTAs
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Sobre': GlobalKey(),
    'Serviços': GlobalKey(),
    'Diferenciais': GlobalKey(),
    'Portfólio': GlobalKey(),
    'Depoimentos': GlobalKey(),
    'Contato': GlobalKey(),
  };

  void _scrollToSection(String key) {
    final context = _sectionKeys[key]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agência de Marketing', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
        actions: [
          _appBarButton('Home', () => _scrollToSection('Home')),
          _appBarButton('Sobre', () => _scrollToSection('Sobre')),
          _appBarButton('Serviços', () => _scrollToSection('Serviços')),
          _appBarButton('Contato', () => _scrollToSection('Contato')),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(key: _sectionKeys['Home']!),
            _buildAboutSection(key: _sectionKeys['Sobre']!),
            _buildServicesSection(key: _sectionKeys['Serviços']!),
            _buildWhyChooseUsSection(key: _sectionKeys['Diferenciais']!),
            _buildPortfolioSection(key: _sectionKeys['Portfólio']!),
            _buildTestimonialsSection(key: _sectionKeys['Depoimentos']!),
            _buildContactSection(key: _sectionKeys['Contato']!),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _appBarButton(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildHeroSection({required Key key}) {
    return Container(
      key: key,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: Colors.blue.withOpacity(0.05),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Maximize Suas Vendas em Marketplaces',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Atraia mais clientes e otimize sua performance online com nossa assessoria especializada em marketing digital para marketplaces.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => _scrollToSection('Contato'),
                child: const Text('Fale Com um Especialista'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required Key key,
    required String title,
    required Widget child,
    Color backgroundColor = Colors.white,
    double maxWidth = 1000,
  }) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                width: 80,
                height: 4,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 40),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection({required Key key}) {
    return _buildSection(
      key: key,
      title: 'Sobre Nossa Agência',
      child: Text(
        'Somos uma agência de marketing digital com foco total em marketplaces. Nossa missão é clara: ajudar sua marca a crescer, se destacar e prosperar no competitivo ambiente online. Combinamos tecnologia, dados e criatividade para entregar estratégias personalizadas que geram resultados mensuráveis.',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildServicesSection({required Key key}) {
    return _buildSection(
      key: key,
      title: 'Nossos Serviços',
      backgroundColor: Colors.grey[50]!,
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          _serviceCard(Icons.insights, 'Consultoria Estratégica', 'Análise de mercado e planejamento para posicionar sua marca de forma eficaz.'),
          _serviceCard(Icons.search, 'Otimização de SEO', 'Aumente a visibilidade dos seus produtos nos resultados de busca.'),
          _serviceCard(Icons.campaign, 'Gestão de Anúncios', 'Criamos e gerenciamos campanhas pagas para impulsionar suas vendas.'),
          _serviceCard(Icons.store, 'Gestão de Loja', 'Cuidamos da operação da sua loja para que você foque no seu negócio.'),
        ],
      ),
    );
  }

  Widget _serviceCard(IconData icon, String title, String description) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 50, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 20),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Text(description, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWhyChooseUsSection({required Key key}) {
    return _buildSection(
      key: key,
      title: 'Nossos Diferenciais',
      child: Text(
        'Foco exclusivo em marketplaces, equipe de especialistas com experiência comprovada, estratégias orientadas por dados e um compromisso real com o sucesso dos nossos clientes. Não somos apenas uma agência, somos seu parceiro de crescimento.',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPortfolioSection({required Key key}) {
    return _buildSection(
      key: key,
      title: 'Portfólio e Casos de Sucesso',
      backgroundColor: Colors.grey[50]!,
      child: Text(
        'Em breve, apresentaremos aqui alguns dos nossos projetos de sucesso, demonstrando como ajudamos clientes a alcançar resultados extraordinários. (Conteúdo a ser adicionado)',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTestimonialsSection({required Key key}) {
    return _buildSection(
      key: key,
      title: 'O Que Nossos Clientes Dizem',
      child: Column(
        children: [
          _testimonialCard(
            '"A assessoria transformou nossa presença online. As vendas dobraram em menos de 6 meses!"',
            '- Cliente Satisfeito, Setor de Eletrônicos',
          ),
          const SizedBox(height: 20),
          _testimonialCard(
            '"Profissionalismo e resultados. A melhor parceria que poderíamos ter feito."',
            '- CEO, Marca de Cosméticos',
          ),
        ],
      ),
    );
  }

  Widget _testimonialCard(String quote, String author) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text(quote, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
            const SizedBox(height: 15),
            Text(author, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection({required Key key}) {
    return _buildSection(
      key: key,
      title: 'Entre em Contato',
      backgroundColor: Colors.grey[50]!,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            const Text(
              'Pronto para levar seu marketplace ao próximo nível? Preencha o formulário abaixo e nossa equipe entrará em contato.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const TextField(decoration: InputDecoration(labelText: 'Seu Nome', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: 'Seu Email', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: 'Sua Mensagem', border: OutlineInputBorder()), maxLines: 4),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Placeholder para lógica de envio
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mensagem enviada com sucesso! (Simulação)')),
                );
              },
              child: const Text('Enviar Mensagem'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          const Text(
            'Vamos Construir Algo Incrível Juntos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _scrollToSection('Contato'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text('Comece Agora'),
          ),
          const SizedBox(height: 40),
          const Text(
            '© 2024 Agência de Marketing Digital. Todos os direitos reservados.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

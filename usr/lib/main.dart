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
        primaryColor: Colors.blueAccent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black87),
          headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black54),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.greenAccent,
          textTheme: ButtonTextTheme.primary,
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

  void _scrollToSection(int sectionIndex) {
    double offset = sectionIndex * MediaQuery.of(context).size.height * 0.8; // Aproximação para rolagem suave
    _scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agência Marketing'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(0),
            child: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(1),
            child: const Text('Sobre', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(2),
            child: const Text('Serviços', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(3),
            child: const Text('Contato', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(),
            _buildAboutSection(),
            _buildServicesSection(),
            _buildWhyChooseUsSection(),
            _buildPortfolioSection(),
            _buildTestimonialsSection(),
            _buildContactSection(),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Colors.blueAccent.withOpacity(0.1),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Especialistas em Assessoria para Marketplaces',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Atraia mais clientes e otimize suas vendas online com nossa expertise em marketing digital.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _scrollToSection(6), // Scroll to contact
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Fale Conosco Agora'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Sobre Nossa Agência',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Somos uma agência dedicada a ajudar marketplaces a crescerem através de estratégias de marketing inovadoras e personalizadas.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'Nossos Serviços',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _serviceCard('Consultoria Estratégica'),
              _serviceCard('Otimização de SEO'),
              _serviceCard('Gestão de Anúncios'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String title) {
    return Card(
      elevation: 4,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.business, size: 50, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyChooseUsSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Por Que Nos Escolher?',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Experiência comprovada, resultados mensuráveis e foco total no sucesso dos seus marketplaces.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'Portfólio e Casos de Sucesso',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          // Placeholder para imagens/casos
          Text('Aqui serão exibidos exemplos de projetos realizados. (Adicione imagens futuras)', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Depoimentos de Clientes',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            '"A assessoria ajudou nosso marketplace a dobrar as vendas!" - Cliente Satisfeito',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'Entre em Contato',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          const TextField(decoration: InputDecoration(labelText: 'Nome')),
          const TextField(decoration: InputDecoration(labelText: 'Email')),
          const TextField(decoration: InputDecoration(labelText: 'Mensagem')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {}, // Placeholder para envio
            child: const Text('Enviar Mensagem'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black87,
      child: Column(
        children: [
          Text(
            '© 2023 Agência de Marketing. Todos os direitos reservados.',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
            child: const Text('CTA Final: Comece Agora'),
          ),
        ],
      ),
    );
  }
}

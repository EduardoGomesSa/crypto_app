## 📚 Sumário

- [Descrição](#descrição)
- [Instalação](#instalação)
- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Arquitetura](#arquitetura)
- [Telas](#telas)

## Descrição
Jornada do Usuário: BrasilCripto

1. Pesquisar Criptomoedas
Como usuário, quero pesquisar criptomoedas pelo nome ou símbolo para obter
informações detalhadas sobre elas.
Motivação: Desejo acompanhar o mercado e descobrir criptomoedas de interesse
rapidamente.
Critérios de Aceitação:
● O sistema deve oferecer um campo de busca na tela inicial para procurar
criptomoedas.
● Os resultados devem incluir informações como preço atual, variação percentual,
volume de mercado e gráfico de desempenho.
● Caso nenhuma criptomoeda seja encontrada, uma mensagem de "Nenhuma
criptomoeda encontrada" deve ser exibida.

2. Adicionar Criptomoedas Favoritas
Como usuário, quero poder salvar criptomoedas como favoritas para acessá-las facilmente
no futuro.

Motivação: Desejo criar uma lista personalizada das moedas que acompanho
regularmente.
Critérios de Aceitação:
● Após realizar uma busca, o usuário deve ver a opção de "Adicionar aos Favoritos"
em cada criptomoeda listada.
● Ao clicar em "Adicionar aos Favoritos", a criptomoeda deve ser armazenada em uma
lista local.
● A lista de favoritos deve ser persistente, mesmo que o aplicativo seja recarregado.

3. Excluir Criptomoedas Favoritas
Como usuário, quero poder excluir criptomoedas da minha lista de favoritos para manter
apenas aquelas que realmente acompanho.
Motivação: Quero manter minha lista organizada e relevante às minhas necessidades.
Critérios de Aceitação:
● O usuário deve conseguir visualizar a lista de favoritos em uma aba separada.
● Cada moeda na lista deve ter a opção de exclusão.
● Antes de excluir, uma mensagem de confirmação deve aparecer.
● Após a exclusão, a moeda deve desaparecer imediatamente da lista de favoritos.

4. Visualizar Detalhes de uma Criptomoeda
Como usuário, quero poder ver informações detalhadas sobre uma criptomoeda específica
para analisar seu desempenho.
Motivação: Desejo avaliar cada moeda com mais profundidade antes de decidir investir ou
acompanhar.
Critérios de Aceitação:
● Ao clicar em uma criptomoeda (na lista de resultados ou favoritos), o usuário deve
ser redirecionado para uma tela de detalhes.
● A tela de detalhes deve exibir informações como preço, volume de mercado, gráficos
de variação e descrição do projeto.

5. Buscar Dados de Criptomoedas Usando uma API
Como usuário, quero que o aplicativo use uma API confiável para fornecer informações
precisas e atualizadas sobre criptomoedas.
Motivação: Quero garantir que os dados exibidos estejam sempre corretos e em tempo
real.
Critérios de Aceitação:
● O aplicativo deve integrar-se com uma API gratuita, como CoinGecko ou CoinCap,
para obter informações de criptomoedas.
● Dados como preço, variação percentual e volume devem ser atualizados em tempo
real.
● Em caso de falha na API, o sistema deve exibir uma mensagem informando o erro.

6. Critério de avaliação
Técnicos
● Qualidade do Código
○ Código limpo, organizado e bem estruturado.
○ Uso de boas práticas como nomenclatura clara, modularização, e
comentários objetivos.
○ Adesão a padrões de desenvolvimento (ex.: SOLID, DRY, KISS).
● Segurança
○ Implementação de boas práticas de segurança (ex.: validação de entradas,
proteção contra injeção de código).

● Performance
○ Soluções otimizadas para evitar gargalos de desempenho.
○ Uso eficiente de recursos, como consultas ao banco e chamadas de API.

Conceituais
● Capacidade de Argumentação
○ Clareza ao justificar decisões técnicas tomadas no projeto.
○ Explicação lógica para o uso de tecnologias, padrões de projeto ou
estratégias adotadas.
● Conhecimento de Padrões
○ Aplicação de padrões de projeto quando necessário (ex.: Factory, Singleton,
Observer).
○ Conhecimento prático de princípios SOLID e como eles influenciaram a
arquitetura.

## Instalação
1. Clone o repósitorio do aplicativo
```bash
  git clone https://github.com/EduardoGomesSa/crypto_app.git
```
2. Crie um .env na raiz do projeto
3. Instale as dependências
```bash
  flutter pub get
```
## Funcionalidades
- ``Buscar todas as cryptomoedas``: Ao inicializar o app, todas as cryptomoedas são buscadas em uma api.
- ``Buscar por nome ou symbol``: Usuário pode buscar uma cryptomoeda por vários parametros.
- ``Favoritar cryptomoedas``: Usuário pode salvar cryptomoedas do seu interesse para facilitar o acompanhamento.
- ``Desfavoritar cryptomoeda``: Usuário pode remover uma crypto da sua coleção.
- ``Limpar favoritos``: Usuário pode remover todas as cryptos de uma vez da lista de favoritas.
  
## Tecnologias
- ``Flutter``: Framework multiplataforma que usa Dart para criar apps nativos com alta performance e código seguro.
- ``GetX``: Biblioteca para Flutter que oferece gerenciamento de estado, injeção de dependência e navegação de forma simples e eficiente.
- ``Dio``: Cliente HTTP para Flutter com suporte a interceptors, timeouts, cancelamento de requisições e recursos avançados de rede.
- ``fluttertoast``: Biblioteca para exibir mensagens rápidas (toasts) na tela, útil para feedbacks imediatos ao usuário, como erro ao fazer login, logout com sucesso, erro ao buscar produtos etc.
- ``SQLite``: Banco de dados leve e que pode ser utulizado para armazenamento de dados em dispositivos movéis.

## Arquitetura

<p>
  Como o teste foi um app pequeno, com poucas telas, o padrão escolhido foi o MVC com adição da camada de Repositories, que são os responsáveis por realizar as requisições a API e ao banco de dados interno (SQLite).
</p>

- ``Pages``: São as telas exibidas aos usuários
- ``Controllers``: Gerenciam a ligação das pages com os models/repositories, fornecendo dados ou removendo-os da page quando necessário
- ``Models``: Representações das entidades do banco de dados / API como objetos no paradigma POO
- ``Repositories``: Camada extra adicionada ao MVC para retirar do model a responsabilidade de lidar com as requisições, o que facilita a manutenção do código
- ``Core``: Responsável por armazenar recursos que serão compartilhados por toda a aplicação, como services, widgets personalizados, routes etc
- ``Bindings``: Responsável por definir quais controllers, serviços ou repositórios devem ser criados quando uma rota for aberta.
<img width="253" height="438" alt="image" src="https://github.com/user-attachments/assets/ae2bf7e0-8632-4b42-a878-b25b84b4ddd0" />

## Telas
### Auth
<p align="left">
  <img src="https://github.com/user-attachments/assets/a0f690bb-5952-4dd1-aead-c9656cd6d0f0" alt="login_app" width="250" />
  &nbsp;&nbsp;&nbsp;
</p>

### Tela de usuários de empresas diferentes
<p align="left">
  <img src="https://github.com/user-attachments/assets/8879ce3d-a0f0-4992-ab8a-8c8579931c13" alt="login_app" width="250" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/2f62f1eb-9619-4bc7-9f92-08fc78d8cd3e" alt="register_app" width="250" />
  &nbsp;&nbsp;&nbsp;
</p>

### Exemplos em funcionamento
<p align="left">
  <img src="https://github.com/user-attachments/assets/08853f89-5c8e-43d7-9ee5-39786213420d" alt="login_app" width="250" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/0adb92a9-d3b2-4818-a4cf-38d9eae52296" alt="register_app" width="250" />
  &nbsp;&nbsp;&nbsp;
</p>

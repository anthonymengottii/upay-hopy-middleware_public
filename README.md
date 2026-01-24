# 🔌 Middleware de Pagamentos - Integração Upay

[![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org/)
[![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/)

> **Middleware de pagamentos em produção** desenvolvido para integração com Hopy Split, suportando múltiplos gateways de pagamento brasileiros (Pagar.me, Citrex, Zendry, Pagflex) com funcionalidades avançadas de processamento de transações, webhooks bidirecionais e gestão de recebedores.

## 🎯 Sobre o Projeto

Este middleware foi desenvolvido para atuar como camada intermediária entre a plataforma Hopy Split e diversos gateways de pagamento brasileiros. O sistema oferece uma **API RESTful completa** para gerenciamento de transações, recebedores e webhooks, com suporte a **múltiplas adquirentes simultâneas**.

### ✨ Destaques

- 🚀 **Sistema em Produção**: Processando transações reais em ambiente de produção
- 🔒 **Segurança Robusta**: API Keys com hash SHA-256, validação de ownership, rate limiting
- 🏗️ **Arquitetura Escalável**: Padrões de design (Factory, Repository, Service Layer)
- 📊 **Observabilidade Completa**: Logging estruturado, health checks, correlation IDs
- 🛡️ **Alta Confiabilidade**: Retry logic, circuit breaker, backup automático

### 🌐 Demonstração

- **API em Produção:** [http://upaybrasil.club](http://upaybrasil.club)
- **Documentação Swagger:** [http://upaybrasil.club/api-docs](http://upaybrasil.club/api-docs)
- **Health Check:** [http://upaybrasil.club/health](http://upaybrasil.club/health)

## 🎯 Principais Funcionalidades

### 💳 Processamento de Pagamentos
- ✅ **Múltiplos Gateways**: Integração com Pagar.me, Citrex, Zendry, Pagflex e Mock para testes
- ✅ **Múltiplas Adquirentes Simultâneas**: Cada API key pode ser vinculada a uma adquirente específica
- ✅ **Métodos de Pagamento**: Suporte completo para PIX, Boleto e Cartão de Crédito/Débito
- ✅ **Recursos Avançados**: Tokenização de cartões, 3D Secure e estorno de transações

### 👥 Gestão de Recebedores
- ✅ **Split de Pagamentos**: Sistema completo de divisão de valores entre recebedores
- ✅ **Gerenciamento Completo**: CRUD completo de recebedores com validações
- ✅ **Configurações Avançadas**: Antecipação automática e configuração de transferências

### 🔐 Segurança e Autenticação
- ✅ **API Keys com Hash SHA-256**: Armazenamento seguro de credenciais
- ✅ **Validação de Ownership**: Clientes só acessam seus próprios recursos
- ✅ **Rate Limiting**: Proteção contra abuso e ataques de força bruta
- ✅ **Sanitização de Logs**: Dados sensíveis são automaticamente removidos dos logs

### 🔔 Webhooks Bidirecionais
- ✅ **Envio Automático**: Notificações automáticas para Hopy Split sobre mudanças de status
- ✅ **Recepção Segura**: Validação de webhooks via JWT e RSA (Citrex) e HTTP Basic Auth (Zendry)
- ✅ **Rastreamento Completo**: Correlation ID para rastreamento de requisições

### 🛡️ Confiabilidade e Observabilidade
- ✅ **Retry Logic**: Retry automático com exponential backoff
- ✅ **Circuit Breaker**: Proteção contra falhas em cascata
- ✅ **Health Checks**: Monitoramento completo da aplicação
- ✅ **Logging Estruturado**: Logs em JSON com Pino para fácil parsing
- ✅ **Backup Automático**: Backups periódicos do banco de dados SQLite

### 📚 Documentação e Testes
- ✅ **Swagger UI**: Documentação interativa com testes integrados
- ✅ **Validação Robusta**: Validação completa com Zod schemas
- ✅ **Testes Unitários**: Cobertura de testes para garantir qualidade
- ✅ **Type Safety**: TypeScript para type safety em tempo de compilação

## 🏗️ Arquitetura

### Stack Tecnológica

**Backend:**
- **Node.js** + **TypeScript** - Runtime e linguagem
- **Express.js** - Framework web
- **SQLite** - Banco de dados
- **Zod** - Validação de schemas
- **Pino** - Logging estruturado

**Segurança:**
- **Helmet** - Headers de segurança HTTP
- **CORS** - Controle de acesso
- **express-rate-limit** - Rate limiting
- **SHA-256** - Hash de API keys

**Documentação:**
- **Swagger/OpenAPI** - Documentação interativa

### Estrutura do Projeto

```
src/
├── controllers/      # Controladores das rotas
├── services/         # Lógica de negócio
│   └── paymentGateway/  # Implementações dos gateways
├── routes/           # Definição de rotas
├── middleware/       # Middlewares (auth, error handling, etc)
├── repositories/     # Camada de acesso a dados
├── utils/            # Utilitários (logger, database, etc)
├── types/            # Definições TypeScript
└── config/           # Configurações da aplicação
```

### Padrões de Design

- **Factory Pattern**: Para criação de instâncias de gateways
- **Repository Pattern**: Para abstração de acesso a dados
- **Service Layer**: Separação de lógica de negócio
- **Middleware Pattern**: Para autenticação e tratamento de erros

## 🔌 Gateways Suportados

| Gateway | Status | Métodos Suportados | Recursos Especiais |
|---------|--------|-------------------|-------------------|
| **Pagar.me** | ✅ | PIX, Boleto, Cartão | Split de pagamentos |
| **Citrex** | ✅ | PIX (API V3) | OAuth 2.0, Validação RSA |
| **Zendry** | ✅ | PIX, Cartão | 3D Secure, Tokenização |
| **Pagflex** | ✅ | PIX, Cartão | Tokenização segura |
| **Mock** | ✅ | Todos (testes) | Simulação de cenários |

## 📡 Endpoints Principais

### Transações
- `POST /hopy_pay/transactions` - Criar transação
- `GET /hopy_pay/transactions` - Listar transações (com filtros e paginação)
- `GET /hopy_pay/transactions/:id` - Consultar transação
- `POST /hopy_pay/transactions/:id/refund` - Estornar transação

### Recebedores
- `POST /hopy_pay/recipients` - Criar recebedor
- `GET /hopy_pay/recipients` - Listar recebedores
- `GET /hopy_pay/recipients/:id` - Obter recebedor
- `PUT /hopy_pay/recipients/:id` - Editar recebedor
- `PATCH /hopy_pay/recipients/:id/balance` - Consultar saldo

### Gerenciamento
- `POST /api-keys` - Criar API key
- `GET /api-keys` - Listar API keys
- `DELETE /api-keys/:id` - Revogar API key

### Monitoramento
- `GET /health` - Health check completo
- `GET /api/info` - Informações da API

## 🚀 Tecnologias e Ferramentas

### Dependências Principais
- `express` - Framework web
- `axios` - Cliente HTTP
- `zod` - Validação de schemas
- `pino` - Logging estruturado
- `swagger-ui-express` - Documentação interativa
- `helmet` - Segurança HTTP
- `express-rate-limit` - Rate limiting

### Desenvolvimento
- `typescript` - Linguagem
- `jest` - Framework de testes
- `tsx` - Execução TypeScript
- `pm2` - Gerenciamento de processos (produção)

## 📊 Métricas e Monitoramento

- **Health Check**: Endpoint `/health` com status detalhado de serviços
- **Logging Estruturado**: Logs em JSON para fácil integração com ferramentas de monitoramento
- **Correlation ID**: Rastreamento de requisições end-to-end
- **Métricas de Performance**: Monitoramento de memória, banco de dados e gateway

## 🔒 Segurança

- ✅ API Keys armazenadas com hash SHA-256
- ✅ Validação de ownership (clientes só acessam seus recursos)
- ✅ Rate limiting configurável
- ✅ Sanitização automática de dados sensíveis nos logs
- ✅ Validação de webhooks via JWT/RSA
- ✅ Headers de segurança HTTP (Helmet)
- ✅ CORS configurável

## 💼 Habilidades Técnicas Demonstradas

### Backend Development
- ✅ **API RESTful**: Design e implementação de APIs RESTful completas
- ✅ **TypeScript**: Desenvolvimento com type safety e interfaces
- ✅ **Express.js**: Framework web para Node.js
- ✅ **Arquitetura de Software**: Aplicação de padrões de design (Factory, Repository, Service Layer)
- ✅ **Validação de Dados**: Uso de Zod para validação robusta de schemas

### Integrações e APIs
- ✅ **Integração com APIs Externas**: Integração com múltiplos gateways de pagamento
- ✅ **OAuth 2.0**: Implementação de autenticação OAuth 2.0 (client_credentials)
- ✅ **Webhooks**: Implementação de webhooks bidirecionais com validação segura
- ✅ **HTTP Clients**: Uso de Axios para requisições HTTP

### Segurança
- ✅ **Autenticação e Autorização**: Sistema de API Keys com hash SHA-256
- ✅ **Validação de Webhooks**: JWT, RSA, HTTP Basic Auth
- ✅ **Rate Limiting**: Proteção contra abuso
- ✅ **Sanitização de Dados**: Remoção automática de dados sensíveis dos logs
- ✅ **Headers de Segurança**: Configuração com Helmet

### Banco de Dados
- ✅ **SQLite**: Gerenciamento de banco de dados SQLite
- ✅ **Repository Pattern**: Abstração de acesso a dados
- ✅ **Backup Automático**: Sistema de backup periódico

### DevOps e Deploy
- ✅ **Deploy em Produção**: Sistema rodando em produção (AWS Lightsail)
- ✅ **PM2**: Gerenciamento de processos em produção
- ✅ **Nginx**: Configuração de reverse proxy
- ✅ **Health Checks**: Monitoramento de saúde da aplicação

### Observabilidade
- ✅ **Logging Estruturado**: Logs em JSON com Pino
- ✅ **Correlation ID**: Rastreamento de requisições end-to-end
- ✅ **Métricas**: Monitoramento de performance e recursos

### Qualidade de Código
- ✅ **Testes**: Testes unitários com Jest
- ✅ **Type Safety**: TypeScript para prevenção de erros
- ✅ **Documentação**: Swagger/OpenAPI para documentação interativa
- ✅ **Error Handling**: Tratamento centralizado de erros

## 🎓 Desafios Técnicos e Soluções

### 1. Integração com Múltiplos Gateways
**Desafio**: Cada gateway tem APIs, formatos e autenticação diferentes.

**Solução**: 
- Implementação de Factory Pattern para criação de instâncias
- Interface comum (`IPaymentGateway`) para abstrair diferenças
- Classes base com métodos auxiliares compartilhados

**Resultado**: Sistema extensível que permite adicionar novos gateways facilmente, mantendo código limpo e organizado.

### 2. Gerenciamento de Múltiplas Adquirentes Simultâneas
**Desafio**: Permitir que diferentes clientes usem diferentes adquirentes simultaneamente.

**Solução**: 
- Vinculação de API keys a adquirentes específicas
- Sistema de roteamento automático baseado na API key
- Fallback para configuração padrão quando não especificado

**Resultado**: Flexibilidade total para clientes, permitindo uso de múltiplas adquirentes conforme necessidade.

### 3. Validação e Segurança de Webhooks
**Desafio**: Cada gateway valida webhooks de forma diferente (JWT, RSA, HTTP Basic Auth).

**Solução**: 
- Implementação de múltiplas camadas de validação
- Middleware específico para cada tipo de validação
- Validação de IP whitelist quando disponível

**Resultado**: Sistema seguro que valida webhooks de diferentes fontes corretamente, garantindo integridade dos dados.

### 4. Confiabilidade e Resiliência
**Desafio**: Garantir que o sistema se recupere de falhas temporárias de APIs externas.

**Solução**: 
- Retry logic com exponential backoff
- Circuit breaker para evitar sobrecarga em falhas persistentes
- Tratamento robusto de erros com logging detalhado

**Resultado**: Sistema robusto que se recupera automaticamente de falhas temporárias, melhorando a experiência do usuário.

### 5. Observabilidade e Debugging
**Desafio**: Facilitar debugging e monitoramento em produção sem expor dados sensíveis.

**Solução**: 
- Logging estruturado em JSON com Pino
- Correlation ID para rastreamento end-to-end
- Sanitização automática de dados sensíveis (CPF, cartão, etc)

**Resultado**: Facilita debugging e monitoramento em produção, mantendo segurança e privacidade dos dados.

## 📈 Melhorias e Recursos Futuros

- [ ] Suporte a mais gateways (Mercado Pago, PagSeguro, etc)
- [ ] Dashboard administrativo
- [ ] Métricas avançadas com Prometheus
- [ ] Suporte a múltiplos bancos de dados
- [ ] Cache distribuído com Redis
- [ ] Fila de processamento com Bull/BullMQ

## 📊 Resultados e Impacto

- ✅ **Sistema em Produção**: Processando transações reais de forma confiável
- ✅ **Múltiplas Integrações**: Suporte a 3+ gateways de pagamento principais
- ✅ **Alta Disponibilidade**: Health checks e monitoramento contínuo
- ✅ **Segurança**: Zero incidentes de segurança desde o deploy
- ✅ **Performance**: Resposta rápida e confiável para todas as requisições

## 🔧 Stack Tecnológica Completa

### Core
- **TypeScript** - Linguagem principal
- **Node.js** - Runtime
- **Express.js** - Framework web

### Banco de Dados
- **SQLite** - Banco de dados relacional

### Validação e Schemas
- **Zod** - Validação de schemas em runtime

### Logging e Observabilidade
- **Pino** - Logging estruturado
- **Pino HTTP** - Logging de requisições HTTP

### Segurança
- **Helmet** - Headers de segurança HTTP
- **CORS** - Controle de acesso cross-origin
- **express-rate-limit** - Rate limiting

### Documentação
- **Swagger/OpenAPI** - Documentação interativa
- **swagger-ui-express** - Interface de documentação

### HTTP Client
- **Axios** - Cliente HTTP para integrações

### Testes
- **Jest** - Framework de testes
- **ts-jest** - Suporte TypeScript para Jest

### Deploy e Produção
- **PM2** - Gerenciamento de processos
- **Nginx** - Reverse proxy e load balancing

## 📝 Sobre o Código

> **Nota**: O código-fonte completo deste projeto está em um repositório privado por questões de segurança e confidencialidade, já que o sistema está em produção processando transações reais.

Este repositório público serve como **portfólio e demonstração** das habilidades técnicas, arquitetura e funcionalidades implementadas. Para mais informações sobre o projeto ou oportunidades de colaboração, sinta-se à vontade para entrar em contato.

## 📧 Contato

Para mais informações sobre este projeto ou oportunidades profissionais, entre em contato através do GitHub.

---

**Desenvolvido com foco em qualidade, segurança e melhores práticas de desenvolvimento. Sistema em produção processando transações reais.**


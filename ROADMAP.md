# 📍 Roadmap do Projeto - App de Aniversário (Arquitetura Híbrida)

Este documento descreve o roadmap completo para o desenvolvimento do aplicativo de registro de fotos, utilizando uma abordagem híbrida: **um portal web para os convidados** e **um app nativo para a aniversariante**.

---

## 🔹 Fase 1 — Concepção & Planejamento

- [x] Definir nome, cores e ícone do app
- [x] Criar wireframes/mockups (Figma) para ambas as plataformas (Web e App)
- [x] Escolher fluxo de autenticação (Auth anônima para simplicidade)
- [x] Especificar estrutura de dados no Firebase (Firestore + Storage)
- [x] Criar repositório no GitHub/GitLab
- [x] Preparar backlog de features

---

## 🔹 Fase 2 — Configuração do Ambiente

- [x] Configurar Flutter SDK e criar projeto
- [x] Criar projeto no Firebase e conectar ao app (Android/iOS/Web)
- [x] Adicionar dependências principais no `pubspec.yaml`
- [x] Configurar Firebase Core, Firestore, Storage e Auth
- [x] Habilitar e configurar o **Firebase Hosting** para o portal web
- [x] Testar build inicial ("Hello World") em todas as plataformas

---

## 🔹 Fase 3 — Lógica Central e Acesso

- [x] Implementar **Auth anônima** no `AuthService` para ser reutilizada por ambos os clientes
- [x] Criar regras de segurança no Firestore e Storage para permitir upload apenas de usuários autenticados

---

## 🔹 Fase 4 — Portal do Convidado (Flutter Web)

- [x] Habilitar o Flutter Web no projeto e criar a estrutura de páginas/rotas
- [x] Desenvolver a UI da página de upload: simples, com instruções claras
- [x] Implementar a lógica de seleção de fotos da câmera ou galeria (usando `image_picker_for_web`)
- [x] Implementar a função de upload para o **Firebase Storage**
- [x] Após o upload, registrar as informações da foto no **Firestore** (`imageUrl`, `userId`, `timestamp`)
- [x] Adicionar feedback visual claro (indicador de progresso, mensagem de sucesso/erro)
- [x] Garantir que o design seja responsivo e funcione bem em qualquer navegador de celular

---

## 🔹 Fase 5 — App da Aniversariante (App Nativo)

- [ ] Estruturar a tela principal do feed (Ex: `home_screen.dart`)
- [ ] Implementar o listener do Firestore (`snapshots`) para ouvir a coleção de fotos
- [ ] Desenvolver a UI para exibir as fotos (Grid, Lista, Cards)
- [ ] Garantir que novas fotos apareçam em **tempo real** sem a necessidade de atualizar a tela
- [ ] Implementar um tema visual coeso (cores, fontes, ícones)
- [ ] Adicionar animações sutis na entrada de novas fotos para uma experiência mais "mágica"

---

## 🔹 Fase 6 — Testes e Refinamento

- [ ] Testar o fluxo completo: fazer upload pelo site e verificar se aparece instantaneamente no app
- [ ] Testar em múltiplos dispositivos e navegadores diferentes
- [ ] Otimizar o tamanho das imagens antes do upload para economizar dados e agilizar o envio
- [ ] Revisar as regras de segurança do Firebase

---

## 🔹 Fase 7 — Extras (Opcional)

- [ ] Reações nas fotos (❤️, 🎉, 😍) no app da aniversariante
- [ ] Exibir o feed de fotos em uma TV no evento (usando a versão web do feed)
- [ ] Notificações push (Firebase Messaging) no app da aniversariante para avisar sobre novas fotos

---

## 🔹 Fase 8 — Publicação & Distribuição

- [ ] Fazer o deploy do portal de upload no **Firebase Hosting**
- [ ] Gerar um QR Code e um link curto para o site e colocar no convite do evento
- [ ] Configurar assinatura do app nativo (keystore/certificados)
- [ ] Publicar o app da aniversariante no **Google Play** (modo não listado) e/ou **App Store TestFlight**

---

## 🎯 Ordem Recomendada de Desenvolvimento

1.  **Configuração e Lógica Central (Fases 1, 2, 3):** Deixar todo o backend e a base do projeto prontos.
2.  **Portal do Convidado (Fase 4):** Focar em ter a porta de entrada das fotos 100% funcional. É a parte mais crítica para o sucesso do evento.
3.  **App da Aniversariante (Fase 5):** Com as fotos já podendo ser enviadas, desenvolver a interface que irá consumi-las.
4.  **Testes e Refinamento (Fase 6):** Conectar as duas pontas e garantir que tudo funciona perfeitamente.
5.  **Publicação e Extras (Fases 7 e 8):** Finalizar o projeto para a entrega.
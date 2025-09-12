# 📍 Roadmap do Projeto - App de Aniversário (Flutter + Firebase)

Este documento descreve o **roadmap completo** para o desenvolvimento do aplicativo de registro de fotos em tempo real do aniversário.  
A ideia é guiar o projeto de ponta a ponta, organizando todas as fases necessárias.

---

## 🔹 Fase 1 — Concepção & Planejamento
- [ ] Definir nome, cores e ícone do app  
- [ ] Criar wireframes/mockups (Figma)  
- [ ] Escolher fluxo de autenticação (Auth anônima, código do evento ou QR code)  
- [ ] Especificar estrutura de dados no Firebase (Firestore + Storage)  
- [ ] Criar repositório no GitHub/GitLab  
- [ ] Preparar backlog de features (Kanban/Jira/Trello)  

---

## 🔹 Fase 2 — Configuração do Ambiente
- [ ] Configurar Flutter SDK e criar projeto  
- [ ] Criar projeto no Firebase e conectar ao app  
- [ ] Adicionar dependências principais no `pubspec.yaml`  
- [ ] Configurar Firebase Core (Android/iOS)  
- [ ] Configurar Firebase Firestore, Storage e Auth  
- [ ] Testar build inicial ("Hello World")  

---

## 🔹 Fase 3 — Autenticação e Acesso ao Evento
- [ ] Implementar **Auth anônima** (MVP)  
- [ ] Criar fluxo de login com **código do evento**  
- [ ] Salvar ID do usuário vinculado ao evento  
- [ ] Criar regras de segurança no Firestore e Storage  

---

## 🔹 Fase 4 — Upload de Fotos
- [ ] Implementar seleção de fotos (câmera/galeria)  
- [ ] Adicionar compressão antes do upload  
- [ ] Upload para **Firebase Storage**  
- [ ] Registrar foto no Firestore (`url`, `userId`, `timestamp`)  
- [ ] Tela de confirmação após upload  

---

## 🔹 Fase 5 — Feed em Tempo Real
- [ ] Criar tela de feed (grid ou lista)  
- [ ] Implementar listener do Firestore (`snapshots`)  
- [ ] Exibir novas fotos em tempo real  
- [ ] Exibir nome/emoji do usuário (se configurado)  
- [ ] Testar feed em múltiplos dispositivos simultâneos  

---

## 🔹 Fase 6 — Experiência do Usuário (UX/UI)
- [ ] Criar tema visual (cores, fontes)  
- [ ] Implementar **cards de fotos** com animações  
- [ ] Adicionar botão flutuante de upload  
- [ ] Tela inicial personalizada (nome da aniversariante)  
- [ ] Feedback visual (loading, erros, sucesso)  

---

## 🔹 Fase 7 — Extras (Opcional)
- [ ] Reações nas fotos (❤️, 🎉, 😍)  
- [ ] Comentários curtos  
- [ ] Notificações push (Firebase Messaging)  
- [ ] Tela de “Melhores momentos” (ranking de fotos mais curtidas)  

---

## 🔹 Fase 8 — Pós-Evento
- [ ] Criar botão para baixar todas as fotos (ZIP)  
- [ ] Gerar galeria web simples (Firebase Hosting)  
- [ ] Criar slideshow automático (opcional)  

---

## 🔹 Fase 9 — Publicação & Distribuição
- [ ] Configurar assinatura do app (keystore/certificados)  
- [ ] Publicar no **Google Play** (modo não listado)  
- [ ] Publicar no **App Store TestFlight**  
- [ ] Gerar QR code/link para convidados  
- [ ] Testar em dispositivos dos convidados  

---

## 🔹 Fase 10 — Entrega Final
- [ ] Testar app com carga real (vários convidados enviando fotos)  
- [ ] Revisar segurança e privacidade  
- [ ] Apresentar o app para a aniversariante como presente  
- [ ] Suporte no dia do evento  

---

## 🎯 Ordem Recomendada de Desenvolvimento
1. Configuração (Fase 1-2)  
2. Login e acesso ao evento (Fase 3)  
3. Upload de fotos (Fase 4)  
4. Feed em tempo real (Fase 5)  
5. UX/UI (Fase 6)  
6. Extras (Fase 7)  
7. Pós-evento (Fase 8)  
8. Publicação (Fase 9)  
9. Entrega final (Fase 10)  

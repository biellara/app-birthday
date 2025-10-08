# App Birthday 🎂✨

Um projeto especial para registrar e compartilhar em tempo real as memórias de uma festa de aniversário.

## Sobre o Projeto

Este é um sistema de compartilhamento de fotos em tempo real desenvolvido para eventos. A solução foi pensada para maximizar a participação dos convidados e, ao mesmo tempo, oferecer uma experiência única e emocionante para a aniversariante.

A arquitetura é **híbrida**, combinando o melhor de duas plataformas:

1.  **Portal Web para Convidados**: Uma interface web super simples e leve, acessível através de um QR Code ou link. Os convidados podem enviar fotos diretamente do celular, sem precisar instalar nenhum aplicativo, removendo qualquer barreira de uso.
2.  **Aplicativo Nativo para a Aniversariante**: Um aplicativo Flutter exclusivo para a aniversariante, onde ela pode visualizar um feed de fotos que é atualizado instantaneamente a cada novo envio dos convidados. A experiência é fluida, imersiva e cheia de animações.

## 🚀 Tecnologias Utilizadas

* **Frontend**: Flutter (para o App Nativo e para o Portal Web)
* **Backend**: Firebase (BaaS - Backend as a Service)
    * **Firebase Authentication**: Para login anônimo e seguro de cada convidado.
    * **Cloud Firestore**: Como banco de dados NoSQL para registrar as informações de cada foto em tempo real.
    * **Firebase Storage**: Para armazenar os arquivos de imagem de forma segura e escalável.
    * **Firebase Hosting**: Para hospedar o portal web dos convidados, com CDN global e SSL gratuito.

## Funcionalidades Planejadas

* [✅] Autenticação anônima para convidados.
* [ ] Upload de fotos simplificado via interface web.
* [ ] Galeria de fotos em tempo real no aplicativo da aniversariante.
* [ ] Feedback visual de carregamento e sucesso no upload.
* [ ] Design responsivo no portal web para funcionar em qualquer celular.
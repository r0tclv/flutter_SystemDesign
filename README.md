# DuoHeart Design System

Design System em Flutter baseado nas telas exportadas do protótipo DuoHeart.

## Componentes

- **Action Button**: ViewModel, Component e Factory para ações reutilizáveis.
- **Tab Bar**: navegação inferior com estado selecionado.
- **List Items**: itens para categorias, preferências e configurações.
- **Welcome & Login**: entrada, formulário de acesso e chamada principal.
- **Home Dashboard**: progresso, atalhos selecionáveis e navegação inferior.
- **Workout Session**: foco do treino, timer funcional e conclusão da sessão.

## Estrutura

```text
lib/
	common/theme/       tokens visuais e tema
	components/         componentes reutilizáveis
	screens/            catálogo e telas de demonstração
	main.dart           entrada do aplicativo
```

As 23 camadas exportadas do Figma estão preservadas em `arquivos/` como referência visual para as próximas telas do aplicativo.

## Executar

```bash
flutter pub get
flutter run
```

# DuoHeart Design System

Design System em Flutter baseado no protótipo DuoHeart desenvolvido para a disciplina Mobile II. O projeto transforma padrões visuais recorrentes em componentes reutilizáveis e telas demonstrativas.

## O que foi implementado

- `DuoActionButton`: variantes `primary`, `secondary` e `danger`, nos tamanhos `small` (40 px), `medium` (52 px) e `large` (64 px), com estados normal, desabilitado e carregando.
- `DuoTabBar`: navegação com estado selecionado e `Badge` opcional nos ícones. A tela de exemplo demonstra carregamento, treinos, metas e erro de perfil.
- `DuoListItem`: itens reutilizáveis para opções, preferências e configurações.
- `DuoProgressBar`: progresso linear com valor, rótulo e cor configuráveis.
- `Welcome Screen`: tela inicial com mascote, chamadas de ação e acesso ao login.
- Feedback: `SnackBar` para sucesso e `AlertDialog` para avisos.
- Login funcional: validação de campos, mensagens de erro e estado de carregamento.
- Tema claro e escuro, alternável na tela inicial.
- Tokens centralizados para cores, tipografia, espaçamentos e raios, com códigos hexadecimais para os modos claro e escuro.
- Telas funcionais de login, dashboard e sessão de treino para demonstrar os componentes em contexto.

## Estrutura

```text
lib/
	common/theme/       tokens visuais e temas claro/escuro
	components/         componentes reutilizáveis
	screens/             catálogo e telas de demonstração
	main.dart            entrada e controle do tema
arquivos/
	bixinhoFOFO.png     mascote usado no fluxo de login
	imanges/             referências exportadas do protótipo
```

## Tokens visuais

As cores possuem nomes semânticos e seus códigos ficam em `lib/common/theme/app_colors.dart`. Os tokens principais são `background`, `primary`, `dark`, `muted` e `border`; o tema escuro possui os equivalentes `backgroundDark`, `darkSurface`, `mutedDark` e `borderDark`.

A tipografia é definida em `AppTextStyles` e aplicada pelo `ThemeData`, permitindo que os mesmos componentes respeitem o modo claro e o escuro sem duplicar estilos nas telas.

## Como explorar

1. Abra **Welcome Screen** para ver a composição baseada nas imagens do protótipo e acessar o login.
2. No login, deixe os campos vazios para ver as validações ou preencha-os para ver o loading de envio.
3. Abra **Foundations** para ver cores dos dois modos, fontes, progresso, loading, estado desabilitado, SnackBar e alerta.
4. Abra **Action Button** para comparar os três tamanhos, três cores/tipos e pressionar **Continuar** para ver a transição de carregamento.
5. Abra **Tab Bar** para ver o badge de metas e selecionar as demonstrações de Início, Plano, Metas e Perfil.
6. No Perfil, pressione **Simular erro** para ver banner de erro e SnackBar.
7. Use o ícone de lua/sol na home para alternar entre os dois temas.

## Executar e validar

```bash
flutter pub get
flutter run
flutter analyze
```

As imagens do protótipo permanecem em `arquivos/imanges/` como referência visual, e o mascote utilizado pelo app está em `arquivos/bixinhoFOFO.png`.

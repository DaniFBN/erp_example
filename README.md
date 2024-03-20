# Comandos Melos

melos bs
melos clean

# Ta errado


# A Fazer

Splash -> Decidir entre login ou home

# Planejamento
8h Componentização - OK
2h Acessibilidade
4h Animação - OK
2h Internacionalização - OK
1h Linter - OK
1h Documentação - OK
8h Modularização - OK
8h Arquitetura - OK
6h Teste - OK


6h API
  HttpService
  Tratamento de erro
  Interceptor
4h Nativo
2h Deploy

12h

# Arch

```
AppWidget
  DiGlobalWidget
    internal
      DiServiceWidget -> SnackBar/IAuthService
      DiUserWidget -> UserStore/IUserRepository
    builder
      MaterialApp
        routes
          /login
            DiLoginWidget -> LoginStore/AuthRepository
              LoginPage -> SnackBar/LoginStore/UserStore
          /home
            HomePage -> UserStore
```

# App

- HomePage
  - DesktopLayout
  - TabletLayout
  - MobileLayout

---

# DS

## Responsiveness

- LayoutResolver
  - Trocar entre **Mobile**, **Tablet** e **Desktop**
- Responsive
  - Contém os cálculos referente a proporção

## Theme

- LightTheme
- DarkTheme

## Widgets

- SideBar
- SideBarItem
- MenuBar
- MenuBarItem

# Core

---

# DevTools

- Linter



# Comandos Melos

melos bs
melos clean

# Ta errado


# A Fazer

Splash -> Decidir entre login ou home

# Planejamento
8h Componentização - OK
2h Acessibilidade
4h Animação
2h Internacionalização

Amanha
1h Linter
1h Documentação
8h Mod
8h Arch
6h API
6h Teste
4h Nativo
2h Deploy

36

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



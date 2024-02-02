Tratamento de erro  

Injeção de dependência > Modular/GetIt/Provider

Controller

- Page
- Widget
- State
- Usecase -> Regra de negócio
- Repository
- Datasource -> OfflineFirst
  - LocalDatasource
  - ApiDatasource
- Service -> Abstração de Package

Widget -> Page/Component -> State -> Repository -> Service -> API/LocalStorage
Widget -> Page -> State -> Usecase -> Repository -> Datasource -> Service -> API/LocalStorage -> Clean Arch

####  ResoCoder
```
presentation
  widget
  page
  state
domain
  usecase
data
  repository
  datasource
```


#### Flutterando
``` 
presenter
  widget
  page
  state
domain
  usecase
infra
  repository
data
  datasource
```

#### Nossa
```
ui
  widget
  page
  layouts
  components
domain
  state
data
  repository
  services
```
Usecase - Caso de Uso, regra de negócio(validação)

Service -> É usado para isolar uma logica, 
  Como eu uso - Abstrair pacotes
Wrapper

Driver -> Acessa um driver, bluetooth, gps, coisas locais(celular)
DAO -> Data Access Object -> Consumo de uma table
Repository/Datasource -> 
  Repository = Lidar com errors, mapper, acesso aos dados 
  Datasource = Diretamente o acesso aos dados
Service -> Junta Repository e Datasource

Entity -> Só tem propriedade, no maximo um getter e copyWith
Model -> Tem de tudo, propriedade, método, getter, copyWith, mapper(fromMap, toMap)

State -> Estado de algo, Gerencia de estado, State Pattern

Widget -> Um elemento burro, só conhece dart e flutter
Component -> Um elemente que conhece, dart, flutter e regra de negócio

ValueObject(VO) -> Objeto de validação(Cpf, cnpf) e/ou junção de algo que não faz sentido sozinho(Price[Valor&Moeda], Address)

Adapter -> Adapter Pattern -> Traduzir algo pra algo
Mapper
Wrapper(Abstração)

DTO -> Data Transfer Object -> Objeto de transferencia de dados -> Param/Response/Adapter
Param -> Param
Payload -> Param
Response -> Uma resposta de algo

Impl -> Indica que é uma implementação(algo quando se tem uma interface)
I(Interface) -> Prefixo que indica que é uma Interface
  Interface é uma classe que DEVE ser implementado, ela é um contrato a ser seguido

Module -> É um módulo

Mock -> Um objeto falso para teste, que terá um comportamento pré determinado

Controller    -> Gerencia diversos estados(reatividades) pra limpar a tela
Facade(Fachada)

View -> Tela
Model 
ViewModel/Controller/Presenter -> Reatividade

Store         -> Gerencia de estado
Controller
Bloc
Cubit
ViewModel
Presenter

Core      -> Coisas que não se encaixam em nenhum outro sufixo
Shared
Helper
Utils

Layout      -> Indicam a parte inicial de ui(Tela)
Page
View
Screen

Error -> Um problema oriundo de um input(validação)
Exception -> Algo não planejado
Failure -> Algum dos dois

Middleware(Guard)     -> Algo que fica no meio 
  Guard       - Route (Guard) Page
  Interceptor - Http (Interceptor) API

Coisa de backend
Handler 
Ports

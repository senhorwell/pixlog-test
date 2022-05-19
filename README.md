# PixLog Translater

Aplicativo desenvolvido para listar recursos de tradução (i18n) disponiveis em [get_resources_since](http://portal.greenmilesoftware.com/get_resources_since).

### Versões utilizadas
- Flutter 3
- Android SDK 31
- Android Studio 2021.2

### Bibliotecas adicionadas
- [http 0.13.4](https://pub.dev/packages/http) (Para requisições http)
- [intl 0.17.0](https://pub.dev/packages/intl) (Para conversões de data)
- [shared_preferences 2.0.15](https://pub.dev/packages/shared_preferences) (Para persistencia de dados mesmo com o aplicativo fechado)

### Sobre o projeto
Como dito na descrição, este projeto é uma listagem simples de um json baixado pelo endpoint acima, com filtragens por **language_id**, **module_id** e **value**. Foram acrescentados alguns pontos como:
- Splashscreen - para ter uma fluidez melhor na abertura do app, foi adicionado um splash com delay
- Botão reload - este botão serve para atualizarmos o objeto local excluindo e fazendo a requisição http novamente.
- SharedPreferences - esta foi uma licença poética pois como pesquisei sobre Riverpod, Provider, Bloc e Modular, são mais utilizados para gestão de estado, mas não recomendados para persistencia de dados. Isso basicamente significa que se nós estivermos usando o aplicativo e abrirmos outro aplicativo sem fechar ele, os dados se manterão, mas se fecharmos e abrirmos o aplicativo, os dados irão ser reiniciados. Com essa biblioteca, nós conseguimos fechar e abrir o app e os dados estarão lá.

### Telas e detalhes

#### Splashscreen
![image](https://user-images.githubusercontent.com/43894406/169191987-5cb7d2c0-f7f5-4a96-9569-a9e44b964194.png)

#### Icone do app
![image](https://user-images.githubusercontent.com/43894406/169194794-cbbd414c-7f41-4454-a3bf-fc883d6ceb7a.png)

#### Home
![image](https://user-images.githubusercontent.com/43894406/169192074-a216942a-2dc8-45a0-b89a-1849c763e692.png)

#### Loading
![image](https://user-images.githubusercontent.com/43894406/169192118-99444305-83dc-4d2e-9c15-dd9c82307ed2.png)

#### Listagem de idiomas
![image](https://user-images.githubusercontent.com/43894406/169192176-5718e994-edde-4287-a1e0-75add27544a7.png)

#### Listagem de módulos
![image](https://user-images.githubusercontent.com/43894406/169192227-5e9f0e30-7887-48e1-b31e-343d4adb600d.png)

#### Pesquisa por value
![image](https://user-images.githubusercontent.com/43894406/169192296-b3b4eafa-9bee-497f-970c-ebd640532f4b.png)



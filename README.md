# Teste efetuado para a Zallpy

 Aplicação em flutter e api em node.js hospedada no google clound atraves do serviço Firefunctions.
 Pasta api contem código da api e pasta mobile apresenta o aplicativo em flutter. 
 
 ### Sobre API: 
  A api pode ser acessada de forma publica pela rota https://testezalppy.web.app/asking com o método get sem necessidade de informações adicionais no header.
durante a chamada a api apresenta as 5 alternativas em uma unica vez afim de economizar tráfego e chamadas. 

  - O retorno:
   Api é composta pelos seguintes campos no body de seu retono: 
    [question] => Recebe o nome da marca.
    [correct] => Recebe o index da resposta correta. 
    
  A opção pelo envio apenas das duas informações se deu devido ao padrão das perguntas ser similar, em caso de formação dinâmica utilizando um banco de dados por exemplo, poderiamos utilizar ainda um campo adicional chamado [response] que receberia as alternativas para exibição na tela. como este não foi o caso optei pela passagem simples de informação. 
  
 - Performance:
   O tempo de reposta da api esta em torno de 400ms com uma carga de 270bites, com a utilização de cache control poderiamos otimizar este tempo de resposta para menos de 80ms porém optei por não utilizar este dispositivo para que o avaliador possa conferir no app a cada utilização uma nova ordem de perguntas gerada de forma aleatória.
   
### Sobre o APP:

  Foram utilizados os seguintes pacotes: 
  
  - flutter_launcher_icons: ^0.8.1 (Pacote utilizado para gerar icones adaptativos para todas as plataformas[ios inclusive])
  - http: ^0.12.2(Pacote para utilização do protocolo http)
 
 A estrutura do app esta utilizando o modelo MVC onde o Model fica responsável pela conexão externa com o protocolo HTTP e o controlador faz a requisição para o Model e devolve esta informação para a camada de visualização(Front End).
 
 O tratamento de erro esta presente de forma generica para retornos diferentes do código 200 da api. porém este tratamento para o usuario se apresenta atravez de um switch que pode ser populado por códigos diversos.  
 
A utilização do widget Stack na tela final é devido a animação de gif presente no seu background em caso de acerto superior a 50% do teste.

  
  
  
  
    


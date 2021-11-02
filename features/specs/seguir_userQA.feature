#language: pt

Funcionalidade: Automatizar envio de conexoes no linkedin
        Sendo um usuário do Linkedin
        Quero fazer o login
        Para acessar o campo de pesquisa
        Pesquisar os usuários que trabalham na área de QA
        Seguir os usuários

        @seguirPorBusca
        Cenario: Seguindo user QA através da busca por usuário.

                Dado que acesso a página de login
                        E submeto o seguinte acesso "matheus.qateste001@gmail.com" e "Bot.123"
                Quando pesquiso um usuário "QA Automation"
                        E seleciono para pesquisar por "Pessoas"
                Então clico para "Conectar" com 5 pessoas

        @seguirPorMinhaRede
        Cenario: Seguindo user QA através da busca por usuário.

                Dado que acesso a página de login
                        E submeto o seguinte acesso "matheus.qateste001@gmail.com" e "Bot.123"
                Quando direciono para tela de Minha Rede
                Então clico para "Conectar" com 10 usuários "Analista de Teste"
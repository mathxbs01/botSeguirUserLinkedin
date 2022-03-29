#language: pt

Funcionalidade: Automatizar funcionalidades basicas do Linkedin
        Sendo um usuário do Linkedin
        Quero fazer o login
        Para seguir usuários e curtir as publicações

        Contexto:
                Dado que acesso a página de login
                        E submeto o seguinte acesso "matheus.qateste001@gmail.com" e "Bot.123"

        @seguirPorBusca
        Cenario: Seguindo user QA através da busca por usuário.

                Quando pesquiso um usuário "QA Automation"
                        E seleciono para pesquisar por "Pessoas"
                Então clico para "Conectar" com 5 pessoas

        @seguirPorMinhaRede
        Cenario: Seguindo user QA através da tela Minha Rede.

                Quando direciono para tela de Minha Rede
                Então clico para "Conectar" com 10 usuários "QA"

        @curtirPub
        Cenario: Curtindo as publicações da minha rede.
                Entao clico em "Gostei" em 10 publicacoes

        @escrevendoPub
        Cenario: Escrevendo um mensagem no Linkedin
                Quando clico para escrever uma publicação
                        E digito a mensagem "Olá Rede, essa é uma mensagem automatizada."
                Então clico para "Publicar"
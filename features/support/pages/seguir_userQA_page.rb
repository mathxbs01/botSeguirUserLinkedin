class Login
    include Capybara::DSL

    def login(email, senha)
        find('#username').set email
        find('#password').set senha
        click_button "Entrar"
    end
end

class Pesquisar
    include Capybara::DSL
    
    def pesquisar(nome)
        pesquisa = all('input[class*="search"]')[0].set nome
        pesquisa.send_keys :enter
    end

    def filtro (pessoa)
        click_button pessoa
        click_button "Conexões"  
        first('span', text: '2º').click
        first('span', text: '3º e +').click
        find('span', text: 'Exibir resultados').click
    end
end

class Seguir
    include Capybara::DSL

    def seguirBuscarUser(conectar, num)

        page.execute_script("window.scrollTo(0, 400)")
        i = 0
        while i <= num

            card = all('div[class="entity-result__item"]')[i]
            conectar = card.find('button').text
            
            if conectar.include? "Conectar"
                card.find("button", :text => conectar).click
                find('button[aria-label="Enviar agora"]').click
                i += 1
            else
                page.execute_script("window.scrollTo(0, document.body.scrollHeight)")
                find('button[aria-label="Avançar"]').click 
            end
        end
    end

    def seguirMinhaRede(conectar, num, user)
        page.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        i = 0
        while i <= num
            card = all('div[class="display-flex flex-1"]')[i]
            qa = card.first('span[class="discover-person-card__occupation t-14 t-black--light t-normal"]').text
            
            if qa.include? user
                sleep 1
                card.find("button", :text => conectar).click
                sleep 1

                nome = card.first('span[class="discover-person-card__name t-16 t-black t-bold"]').text
                temp_shot = page.save_screenshot("logs/#{nome}.png")
                i += 1
            else
                page.execute_script("window.scrollTo(0, document.body.scrollHeight)")

                i += 1
            end
        end
        puts nome
    end
end

class Tela 
    include Capybara::DSL
    
    def minhaRede
        find('a[data-control-name="nav_mynetwork"]').click
    end
end

class Reacao
    include Capybara::DSL

    def gostei(gostei, num)
        i = 0
        while i <= num
            if page.has_css?("button", :text => gostei)
                tabela = all('div[class*="feed-shared-social-actions"]')[i]
                tabela.find('button[aria-label*="Gostar da publicação"]').click
                sleep 2

                i += 1
            else
                page.execute_script("window.scrollTo(0, document.body.scrollHeight)")[i]

                i += 1 
            end
        end
    end
end

class Publicacao

    include Capybara::DSL

    def caixa_de_mensagem
        find('span', "Começar publicação").click

    end
    def mensagem(mensagem)
        find('div[role="textbox"]').set mensagem
    end

    def botao_publicar(publicar)
        find('span', text: publicar).click
    end
end
module Print
    module Passos
        def print
            temp_shot =  page.save_screenshot("logs/temp_screenshot.png")
        
            Allure.add_attachment(
                name: "Screenshot",
                type: Allure::ContentType::PNG,
                source: File.open(temp_shot),
           )
        end  
    end
end

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
        first('span', text: '3º+').click
        find('span', text: 'Exibir resultados').click
    end
end

class Seguir
    include Capybara::DSL
    include Print::Passos

    def seguirBuscarUser(conectar, num)
        page.execute_script("window.scrollTo(0, 400)")
        i = 0
        while i <= num
            if page.has_css?("button", :text => conectar)
                all("button", :text => conectar)[i].click
                print
                find('button[aria-label="Enviar agora"]').click
                page.execute_script("window.scrollTo(400, 800)") #Como scrollar um valor x a cada conectar?
                i += 1
            else
                page.execute_script("window.scrollTo(0, document.body.scrollHeight)")
                find('button[aria-label="Avançar"]').click 
            end
        end
    end

    def seguirMinhaRede(conectar, user)
        page.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        i = 0
        while i <= 10
            if page.has_css?("span", :text => user)
                all("button", :text => conectar)[i].click
                print
                i += 1
            end
        end
    end
end

class Tela 
    include Capybara::DSL
    
    def minhaRede
        find('a[data-control-name="nav_mynetwork"]').click
    end
end
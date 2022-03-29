Dado('que acesso a página de login') do
    visit '/'
end
  
Dado('submeto o seguinte acesso {string} e {string}') do |email, senha|
    @login.login(email,senha)
end
  
Quando('pesquiso um usuário {string}') do |nome|
    @pesquisar.pesquisar(nome)
end
  
Quando('seleciono para pesquisar por {string}') do |pessoa|
    @pesquisar.filtro(pessoa)
end
  
Então('clico para {string} com {int} pessoas') do |conectar, num|
    @seguir.seguirBuscarUser(conectar, num)
end

Quando('direciono para tela de Minha Rede') do
    @tela.minhaRede
end

Então('clico para {string} com {int} usuários {string}') do |conectar, num, user|
    @seguir.seguirMinhaRede(conectar, num, user)
end

Entao('clico em {string} em {int} publicacoes') do |gostei, num|
    @reacao.gostei(gostei, num)
end

Quando('clico para escrever uma publicação') do
    find('button[class="artdeco-button artdeco-button--muted artdeco-button--4 artdeco-button--tertiary ember-view share-box-feed-entry__trigger"]').click
end
  
Quando('digito a mensagem {string}') do |mensagem|
    @publicacao.mensagem(mensagem)
end
  
Então('clico para {string}') do |publicar|
    @publicacao.botao_publicar(publicar)
end
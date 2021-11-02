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
  
Então('clico para {string} com usuários {string}') do |conectar, user|
    @seguir.seguirMinhaRede(conectar, user)
end
Before do
    @login = Login.new
    @seguir = Seguir.new
    @pesquisar = Pesquisar.new
    @tela = Tela.new
    @reacao = Reacao.new
    @publicacao = Publicacao.new

    page.driver.browser.manage.window.maximize
end

After do
    temp_shot =  page.save_screenshot("logs/temp_screenshot.png")

    Allure.add_attachment(
        name: "Screenshot",
        type: Allure::ContentType::PNG,
        source: File.open(temp_shot),
   )
end
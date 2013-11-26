class VinCodNotifier < ActionMailer::Base
  default from: 'Запрос по Vin коду <falconmotors@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.vin_cod_notifier.received.subject
  #
  def received(vin_cod)
    @vin_cod = vin_cod

    mail to: "falcon.vinnica@gmail.com", subject: 'Запрос по vin коду на Falcon motors'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.vin_cod_notifier.shipped.subject
  #
  def shipped
    
  end
end

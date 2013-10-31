class OrderNotifier < ActionMailer::Base
  default from: 'Запчасти <falconmotors@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject:'Подтверждение заказа в Falconmotors'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject:'Заказ из  Falconmotors отправлен'
  end
end
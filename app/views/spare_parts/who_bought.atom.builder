atom_feed do |feed|
  feed.title "Kто купил #{@spare_part.title}"

  latest_order = @spare_part.orders.sort_by(&:updated_at).latest_order
  feed.updated(latest_order && latest_order.updated_at)

  @spare_part.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Заказ #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
      	xhtml.p "Отправленно к #{order.address}"

        xhtml.table do
          xhtml.tr do
            xhtml.th 'Запчасть'
            xhtml.th 'Колл-во'
            xhtml.th 'Общая сумма'
          end

          order.line_items.each do |item|
            xhtml.tr do 
              xhtml.td item.spare_part.title
              xhtml.td item.qantity
              xhtml.td number_to_currency(item.total_price, unit: "грн", format: "%n %u")
            end
          end

          xhtml.tr do 
            xhtml.th 'total', colspan:2
            xhtml.th number_to_currency(order.line_items.map(&:total_price).sum, unit: "грн", format: "%n %u" )
        end
      end
      xhtml.p "Способ оплаты #{order.pay_type}"
    end
    entry.author do |author|
      entry.name order.name
      entry.email order.email
    end
  end
 end
end
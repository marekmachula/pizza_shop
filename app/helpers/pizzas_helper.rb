module PizzasHelper
  def pizza_current_price(pizza)
    pizza.promo_price.blank? ? pizza.price : pizza.promo_price
  end

  def pizza_current_price_total(pizza, quantity)
    pizza_current_price(pizza) * quantity
  end

  def promotion_label(pizza)
    pizza.promo_price.blank? ? '' : content_tag(:span, 'Cena promocyjna', class: 'label label-danger')
  end
end
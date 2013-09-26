module ApplicationHelper

  def first_page
    @page == 1
  end

  def pages_left(number, operator)
    if operator == "+"
      @page.send(operator, page_total)
    elsif operator == "-"
      @page.send(operator, 1)
    end
  end

  def page_total
    User.count/50
  end



end


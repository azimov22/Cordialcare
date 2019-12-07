module ApplicationHelper
  def tenge(v)
    n = number_with_precision(v, precision: 2)
    number_with_delimiter(n, delimiter: " ", separator: ",") + " ₸"
  end
end

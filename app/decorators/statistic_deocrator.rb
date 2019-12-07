class StatisticDecorator < Draper::Decorator
  def total_team_sales_amount
    m = Member.find_by(id: object.id)
    m.team

  end
end
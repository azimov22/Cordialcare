class SaleStatus
  ALL = {
      new:         { name: "New",    color: "blue", url: "new" },
      accepted: { name: "Accepted", color: "green", url: "accepted" },
      updated: { name: "Updated", color: "red", url: "updated" }
  }
  def self.all
    ALL.keys.map{ |s| SaleStatus.new(s) }
  end

  def self.without_last
    ALL.keys.without(:closed).map{ |s| SaleStatus.new(s)}
  end

  def initialize(status)
    @status = status.to_sym
  end

  def ==(other)
    [SaleStatus, Symbol, String].include?(other.class) && @status == other.to_sym
  end

  def to_sym
    @status
  end

  def to_s
    name
  end

  def name
    ALL.dig(@status, :name) || "—"
  end

  def url
    ALL.dig(@status, :url)
  end

  def color
    ALL.dig(@status, :color) || "gray"
  end
end

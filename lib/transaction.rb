class Transaction

  attr_reader :amount, :time

  def initialize(amount)
    @amount = amount
    @time = Time.now
  end

  def date
    time.strftime('%d/%m/%Y')
  end

  def is_credit?
    amount >=0
  end

end

class Transaction

  attr_reader :amount, :time

  def initialize(amount)
    @amount = amount
    @time = Time.now
  end

  def date
    time.strftime('%d/%m/%Y')
  end

  def statement_string
    if is_credit?
      "#{date} || #{sprintf("%.2f", amount)} || ||"
    else
      "#{date} || || #{sprintf("%.2f", -amount)} ||"
    end
  end

  def is_credit?
    amount >=0
  end

# sprintf("%.2f", balance)
end

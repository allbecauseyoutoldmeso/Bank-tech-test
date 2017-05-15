class Statement

  attr_reader :transactions, :heading

  def initialize(transactions)
    @transactions = transactions
    @heading = "date || credit || debit || balance"
  end

  def format_transactions
    fomatted_transactions = []
    running_total = 0
    transactions.each do |transaction|
      fomatted_transactions.push "#{transaction.statement_string} #{sprintf("%.2f", running_total += transaction.amount)}"
    end
    fomatted_transactions
  end

  def print_self
    puts heading
    format_transactions.reverse.each do |formatted_transaction|
      puts formatted_transaction
    end
  end

end

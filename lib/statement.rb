class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def format_transactions
    fomatted_transactions = []
    running_total = 0
    @transactions.each do |transaction|
      fomatted_transactions.push "#{transaction.statement_string} #{sprintf("%.2f", running_total += transaction.amount)}"
    end
    fomatted_transactions
  end

  def print_self
    puts "date || credit || debit || balance"
    format_transactions.reverse.each do |formatted_transaction|
      puts formatted_transaction
    end
  end

end

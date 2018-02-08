class Transfer

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != "complete"
    receiver.balance += @amount
    sender.balance -= @amount
    self.status = "complete"
    end
    if sender.valid? == false
      puts "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    end
  end

end

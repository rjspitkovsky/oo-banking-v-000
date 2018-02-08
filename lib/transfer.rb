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
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" && self.valid? 
      receiver.balance -= @amount
      sender.balance += @amount
    end
    self.status == "reversed"
  end

end

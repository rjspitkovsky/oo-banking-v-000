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
    sender.balance -= @amount
    receiver.balance += @amount
    self.status = "complete"
    if sender.valid? == false
      self.status = "Transaction rejected. Please check your account balance."
    end 
  end

end

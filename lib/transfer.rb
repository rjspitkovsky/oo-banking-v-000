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
    if sender.valid? == false 
      self.status = "rejected"
    else 
      receiver.balance += @amount 
      sender.balance -= @amount 
    
    # receiver.balance += @amount
    # sender.balance -= @amount
    # self.status = "complete"
    # if sender.valid? == false
    #   self.status = "rejected"
    end
  end

end

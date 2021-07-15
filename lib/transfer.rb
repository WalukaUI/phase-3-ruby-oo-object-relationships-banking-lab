class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
 
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  
  end
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      else
      self.reject
      end
  end
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      self.reject
    end
  end
  def reject
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

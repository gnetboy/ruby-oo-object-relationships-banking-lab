class Transfer
  attr_accessor :sender,:receiver,:amount,:status
 
  
  def initialize(sender,receiver,amount)
      @sender= sender
      @receiver= receiver
      @amount= amount
      @status= "pending"
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  # def execute_transaction
  #      if @sender.balance < @amount && self.valid?
  #        @status="rejected"
  #        return "Transaction rejected. Please check your account balance."
  #      elsif self.valid?  && @status !="complete" 
  #         @receiver.balance += self.amount
  #         @sender.balance -= self.amount
  #         @status ="complete"
  #      end
  # end
  def execute_transaction
     
    if self.valid? && self.sender.balance > self.amount && self.status != "complete" 
        #@sender.balance -= amount
        @sender.deposit( @amount * -1)
        @receiver.deposit( @amount )
        #@receiver.balance += amount
        @status = "complete"
    else @sender.balance < amount || self.sender.valid?
         @status = "rejected"
     "Transaction rejected. Please check your account balance."
    end
  end  
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end
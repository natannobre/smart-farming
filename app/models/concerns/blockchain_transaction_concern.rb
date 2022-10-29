module BlockchainTransactionConcern
  extend ActiveSupport::Concern

  # The code inside the included block is evaluated
  # in the context of the class that includes the BlockchainTransactionConcern concern.
  # You can write class macros here, and
  # any methods become instance methods of the including class.
  included do
    def date_to_timestamp(date)
      date.to_time.to_i
    end
  end

  # The methods added inside the class_methods block (or, ClassMethods module)
  # become the class methods on the including class.
  # class_methods do
  # end
end

class PaymentMethod < ApplicationRecord
  belongs_to :drug_store
  enum payment_type: [ :tarjeta, :efectivo, :seguro]
end

class Order < ActiveRecord::Base
  require "active_merchant/billing/rails"

  PAYMENT_TYPES = ["Visa", "Chase", "Mastercard"]
  validates :name, :address, :email, presence: true
  # validates :pay_type, inclusion: PAYMENT_TYPES

  attr_accessor :card_security_code
  attr_accessor :credit_card_number
  attr_accessor :expiration_month
  attr_accessor :expiration_year

  validates :name, presence: true
  validates :card_security_code, presence: true
  validates :credit_card_number, presence: true
  validates :expiration_month, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :expiration_year, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }



  has_many :line_items, dependent: :destroy
  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal


  def credit_card
    ActiveMerchant::Billing::CreditCard.new(
      number:              credit_card_number,
      verification_value:  card_security_code,
      month:               expiration_month,
      year:                expiration_year,
      first_name:          first_name,
      last_name:           last_name
      )
  end

  def valid_card
    if !credit_card.valid?
      errors.add(:base, "The credit card information you provided is not valid.  Please double check the information you provided and then try again.")
      false
    else
      true
    end
  end

  def process
    if valid_card
      response = GATEWAY.authorize(amount * 100, credit_card)
      if response.success?
        transaction = GATEWAY.capture(amount * 100, response.authorization)
        if !transaction.success?
          errors.add(:base, "The credit card you provided was declined.  Please double check your information and try again.") and return
          false
        end
        update_columns({authorization_code: transaction.authorization, success: true})
        true
      else
        errors.add(:base, "The credit card you provided was declined.  Please double check your information and try again.") and return
        false
      end
    end
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
    end
end

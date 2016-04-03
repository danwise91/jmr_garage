require "active_merchant"

if Rails.env == "development"
    ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")
    ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true
    ActiveMerchant::Billing::Base.mode = :test

login = ENV['GATE_LOG']
password = ENV['GATE_PASS']
elsif Rails.env == "production"
  login = ENV['GATE_LOG']
  password = ENV['GATE_PASS']
end

STANDARD_GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
      login: login,
      password: password
})

paypal = {
  :login => ENV['EXPRESS_GATE_ID']
  :password => ENV['EXPRESS_GATE_PASS']
  :signature => ENV['SIGNATURE']
}

  EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal)

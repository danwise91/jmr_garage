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

GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
      login: login,
      password: password
})

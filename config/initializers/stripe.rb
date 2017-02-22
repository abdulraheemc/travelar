if Rails.env == 'production'
  Rails.configuration.stripe = {
    :publishable_key => "pk_test_NjlMZPedRJexWshV9tBNaiSR",
    :secret_key      => "sk_test_itOCIEvLG5O5cBJSk9FtmX1s"
  }
else
  Rails.configuration.stripe = {
    :publishable_key => "pk_test_NjlMZPedRJexWshV9tBNaiSR",
    :secret_key      => "sk_test_itOCIEvLG5O5cBJSk9FtmX1s"
  }
end

Stripe.api_key = "sk_test_itOCIEvLG5O5cBJSk9FtmX1s"
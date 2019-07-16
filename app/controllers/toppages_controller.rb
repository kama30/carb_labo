class ToppagesController < ApplicationController
  before_action :set_twitter_client

  def index
    @tweets = @twitter.search("#php -rt", lang: 'ja', result_type: "recent").take(3)
  end
  
  def test
  end
  
  private
  
  def set_twitter_client
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = "I8RVuRZd6F7Bl5e1yQk7t37xR"
      config.consumer_secret     = "BOpNkEXSiV2osZnCNysF9VWJwr8ZAVhHe4XsoBvmw6BCEHYEuu"
      config.access_token        = "2392232876-dxQuYLwSlh4A8qlDaMkPx0gb8kdmPoFAxLYSByN"
      config.access_token_secret = "Wc3psIGmghU8JxBaW6aNhkJRJh7v1vSw2hFfevHnOm9O7"
    end
  end
end

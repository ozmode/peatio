# frozen_string_literal: true

module API
  module V2
    module CoinMarketCap
      module Helpers
        def format_ticker(ticker, market)
          {
            base_id: market.base_currency,
            quote_id: market.quote_currency,
            last_price: ticker[:last],
            base_volume: ticker[:amount],
            quote_colume: ticker[:volume],
            isFrozen: market.state.enabled? ? 0 : 1
          }
        end

        def unified_cryptoasset_id(code)
          con = Faraday::Connection.new "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?CMC_PRO_API_KEY=UNIFIED-CRYPTOASSET-INDEX&listing_status=active&symbol=#{code}"
          res = con.get
          JSON.parse(res.body)['data'][0]['id']
        end
      end
    end
  end
end

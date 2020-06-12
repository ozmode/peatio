# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module CoinMarketCap
      module Entities
        class Ticker < API::V2::Entities::Base
          # expose(
          #   :base_id,
          #   documentation: {
          #     desc: 'The quote pair Unified Cryptoasset ID',
          #     type: String
          #   }
          # )

          # expose(
          #   :quote_id,
          #   documentation: {
          #     desc: 'The base pair Unified Cryptoasset ID.',
          #     type: String
          #   }
          # )

            expose(
              :last_price,
              documentation: {
                desc: 'The price of the last executed order.',
                type: BigDecimal
              }
            ) do |ticker|

              ticker.last
            end

            expose(
              :base_volume,
              documentation: {
                desc: '24 hour trading volume in base pair volume.',
                type: BigDecimal
              }
            ) do |ticker|
              ticker.amount
            end

            expose(
              :quote_colume,
              documentation: {
                desc: '24 hour trading volume in quote pair volume.',
                type: BigDecimal
              }
            ) do |ticker|
              ticker.volume
            end

            private

            def unified_cryptoasset_id(code)
              con = Faraday::Connection.new "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?CMC_PRO_API_KEY=UNIFIED-CRYPTOASSET-INDEX&listing_status=active&symbol=#{code}"
              res = con.get
              JSON.parse(res.body)['data'][0]['id']
            end
        end
      end
    end
  end
end

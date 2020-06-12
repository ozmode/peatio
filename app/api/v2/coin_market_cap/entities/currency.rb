# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module CoinMarketCap
      module Entities
        class Currency < API::V2::Entities::Base
            expose(
              :id,
              documentation: {
                desc: 'Cryptocurrency code.',
                type: String
              }
            ) do |currency|
              currency.id.upcase
            end

            expose(
              :name,
              documentation: {
                desc: 'Full name of cryptocurrency.',
                type: String
              }
            ) do |currency|
              currency.name
            end

            expose(
              :unified_cryptoasset_id,
              documentation: {
                desc: 'Unique ID of cryptocurrency assigned by Unified Cryptoasset ID.',
                type: String
              }
            ) do |currency|
              unified_cryptoasset_id(currency.id)
            end

            expose(
              :can_withdraw,
              documentation: {
                desc: 'Identifies whether withdrawals are enabled or disabled.',
                type: String
              }
            ) do |currency|
              currency.withdrawal_enabled
            end

            expose(
              :can_deposit,
              documentation: {
                desc: 'Identifies whether deposits are enabled or disabled.',
                type: String
              }
            ) do |currency|
              currency.deposit_enabled
            end

            expose(
              :min_withdraw,
              documentation: {
                desc: 'Identifies the single minimum withdrawal amount of a cryptocurrency.',
                type: String
              }
            ) do |currency|
              currency.min_withdraw_amount
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

# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module CoinMarketCap
      class Currencies < Grape::API
        desc 'Get list of currencies'
        get '/assets' do
          currencies = Currency.coins.visible.ordered
          begin
            present currencies, with: API::V2::CoinMarketCap::Entities::Currency
          rescue StandardError => e
            report_exception(e)
            error!({ errors: ['coinmarketcap.currencies.cant_fetch'] }, 422)
          end
        end
      end
    end
  end
end

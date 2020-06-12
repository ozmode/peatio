# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module CoinMarketCap
      module Entities
        class PublicTrade < API::V2::Entities::Base
          expose(
            :trade_id,
            documentation: {
              type: String,
              desc: 'A unique ID associated with the trade for the currency pair transaction.'
            }
          ) do |trade|
            trade.id
          end

          expose(
            :price,
            documentation: {
              type: BigDecimal,
              desc: 'Transaction price in base pair volume.'
            }
          )
        end
      end
    end
  end
end

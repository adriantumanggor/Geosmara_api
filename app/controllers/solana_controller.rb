require 'net/http'
require 'json'

class SolanaController < ApplicationController
  def balance
    token = params[:token]
    uri = URI("http://solana:4567/balance/#{token}")
    res = Net::HTTP.get(uri)
    render json: JSON.parse(res)
  end

  def transfer
    uri = URI("http://solana:4567/transfer")
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = {
      token: params[:token],
      recipient: params[:recipient],
      amount: params[:amount]
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    render json: JSON.parse(res.body)
  end
end

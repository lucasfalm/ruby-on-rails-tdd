require 'rails_helper'

RSpec.describe "Customers", :customer_request, type: :request do
  context "GET /customers" do
    it "index - JSON 200" do
      get "/customers.json"
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      ])
    end

    it "show - JSON 200" do
      get "/customers/1.json"
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end

    it 'create - JSON' do
      headers = { "ACCEPT" => "application/json"}
      member = create(:member)
      sign_in member
      customers_params = attributes_for(:customer)
      post "/customers.json", params: { customer: customers_params}, headers: headers
      p response.body
    end

  end
end

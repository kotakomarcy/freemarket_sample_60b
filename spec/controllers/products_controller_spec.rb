require 'rails_helper'

describe ProductsController do
  describe 'GET #create' do
    it 'DBにレコードが追加される' do
      product = create(:product)
    end
    
  end
end
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end

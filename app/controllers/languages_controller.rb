# frozen_string_literal: true

class LanguagesController < ApplicationController
  def index
    @data = JSON.parse(File.read('public/languages.json'))
    # set empty search value if this param is empty
    query = params.dig(:search, :query) || ' '
    # use service obj for filtering data
    filtered_data = SearchService.new(@data).search(query)
    @data = Kaminari.paginate_array(filtered_data).page(params[:page]).per(20)
  end
end

class SearchController < ApplicationController
  def index
    if params[:q]
      @results = PgSearch.multisearch(params[:q])
    end
  end
end

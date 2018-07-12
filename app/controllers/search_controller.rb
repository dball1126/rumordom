class SearchController < ApplicationController
  
  def search
    if params[:term].nil?
      @businesses = []
    else
      @businesses = Article.search params[:term]
    end
  end
  
end

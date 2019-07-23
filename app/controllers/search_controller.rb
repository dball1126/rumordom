class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @businesses = []
      @users = []
    else
      @businesses = Article.search params[:term]
      @users = Article.search params[:term]
    end
  end
end

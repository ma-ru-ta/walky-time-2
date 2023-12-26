class Admin::SearchesController < ApplicationController
before_action :authenticate_admin!

  def search
    @content = params[:content]

    @records = User.search_for(@content)
  end

end



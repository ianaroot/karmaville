class UsersController < ApplicationController
  def index

    unless params[:page]
      redirect_to "/?page=1"
    end


    if params[:page]
      @page = params[:page].to_i
      if @page < 1
        redirect_to "/?page=1"
      end
      if @page > page_count = User.count/50
        redirect_to "/?page=#{(page_count)}"
      end
      @users = User.by_karma.page(@page)
    else
      @users = User.by_karma.limit(50)
    end


  end
end

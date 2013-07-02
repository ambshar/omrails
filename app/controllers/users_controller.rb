class UsersController < ApplicationController
  around_filter :catch_not_found
def show
  	 @user = User.find(params[:id])
  	 @shares = @user.shares.page(params[:page]).per_page(10)
  	end

private

def catch_not_found
  yield
rescue ActiveRecord::RecordNotFound
  redirect_to root_url, :flash => { :error => "User not found." }
end


end

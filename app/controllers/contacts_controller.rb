class ContactsController < ApplicationController
  def index
  end

  def create
    # set a local variable @name to the value of the
    # name parameter in the http request
    @name = params[:name]
    @email = params[:email]
    @text = params[:text]
  end
end

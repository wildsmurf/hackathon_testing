class AccountsController < ApplicationController
  before_action :set_account, except: [:new]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private
    def set_account
      @account = current_user
    end

end

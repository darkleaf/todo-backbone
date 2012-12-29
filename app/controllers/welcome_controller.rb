class WelcomeController < ApplicationController
  def show
    @tasks = Task.all
  end
end

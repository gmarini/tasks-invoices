class PagesController < ApplicationController
  def home
  	@tasks = Task.all
  end

  def about
  end
end

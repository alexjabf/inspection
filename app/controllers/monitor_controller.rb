class MonitorController < ApplicationController
  include MonitorHelper 
  def live
    routes_histories
  end
end

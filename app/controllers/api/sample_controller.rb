module Api
  class SampleController < ApplicationController
    def index
      render json: {:name => 'sample'}
    end
  end
end

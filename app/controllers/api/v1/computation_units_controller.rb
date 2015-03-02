module Api
  module V1
    class ComputationUnitsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      protect_from_forgery with: :null_session
      before_filter :restrict_access

      respond_to :json

      def index
        respond_with ComputationUnit.all
      end

      def show
        respond_with ComputationUnit.find(params[:id]) 
      end

      def create
        respond_with ComputationUnit.create(computation_unit_params)
      end

      def update
        respond_with ComputationUnit.update(params[:id], params[:product])
      end

      def destroy
        respond_with Product.destroy(params[:id])
      end

      def computation_unit_params
      params.require(:computation_unit).permit(:ram, :CPU_Cores, :CPU_Clock, :storage, :ip, :uplink, :downlink, :online, :name, :location, :added, :updated)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          puts Digest::HMAC.hexdigest(options.to_s, ENV["HMAC_Api_Key"].to_s, Digest::SHA1)
          if(Digest::HMAC.hexdigest(options.to_s, ENV["HMAC_Api_Key"].to_s, Digest::SHA1) == token)
            true
          else
            false
          end
        end
      end
    end
  end
end
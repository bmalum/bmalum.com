module Api
  module V1
    class ComputationUnitsController < ApplicationController
      protect_from_forgery except: :index

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
    end
  end
end
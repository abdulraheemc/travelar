class HomeController < ApplicationController
  before_action :set_filter, only: [:index,:hajjpackage,:umrahpackage]
  
  def traveler_dashboard
  end

  def agent_dashboard
  end

  def hajjpackage
    @packages = Package.where(:trip_to=>"Hajj")
  end

  def umrahpackage
    @packages = Package.where(:trip_to=>"Umrah")
  end

  def about_us
  end

  def book_now
    @package = Package.find params[:id]
  end


def index
 
  	@a = 0  
  	@agencies = Agency.all
   
    #@package = Package.all
    #@package_trips = Package.select(:trip_to).distinct
    #@prices = Pricelimit.select(:price)
    #@durations = Package.select(:duration).distinct


    if params[:trip_ids]
      @packages = Package.where("trip_to IN (?)",params[:trip_ids])
      #@package_trips = Package.select(:trip_to).where("package_id IN (?)", params[:trip_ids])
    end

    if params[:agency_ids]
      @packages = Package.where("agency_id IN (?)", params[:agency_ids])
    end

    if params[:price_ids]
        @packages = Package.where("price >= ? and price <= ?", params[:price_ids].first.to_i - 4999, params[:price_ids].last)
    end

    if params[:duration_ids]
      @packages = Package.where("duration IN (?)", params[:duration_ids])
    end

    if params[:trip_ids] && params[:agency_ids]
      @packages = Package.where("trip_to IN (?) AND agency_id IN (?)", params[:trip_ids], params[:agency_ids])
    end

    if params[:trip_ids] && params[:price_ids]
      @packages = Package.where("trip_to IN (?) AND price >= ? and price <= ?", params[:trip_ids], params[:price_ids].first.to_i - 4999, params[:price_ids].last)
    end

    if params[:trip_ids] && params[:duration_ids]
      @packages = Package.where("trip_to IN (?) AND duration IN (?)", params[:trip_ids], params[:duration_ids])
    end

    if params[:agency_ids] && params[:price_ids]
      @packages = Package.where("agency_id IN (?) AND price >= ? and price <= ?", params[:agency_ids], params[:price_ids].first.to_i - 4999, params[:price_ids].last)
    end

    if params[:price_ids] && params[:duration_ids]
      @packages = Package.where("price >= ? and price <= ? AND duration IN (?)", params[:price_ids].first.to_i - 4999, params[:price_ids].last, params[:duration_ids])  
    end

    if params[:agency_ids] && params[:duration_ids]
      @packages = Package.where("agency_id IN (?) AND duration IN (?)", params[:agency_ids], params[:duration_ids])
    end

    if params[:trip_ids] && params[:agency_ids] && params[:price_ids]
      @packages = Package.where("trip_to IN (?) AND agency_id IN (?) AND price >= ? and price <= ?", params[:trip_ids],params[:agency_ids], params[:price_ids].first.to_i - 4999, params[:price_ids].last)                     
    end

    if params[:trip_ids] && params[:agency_ids] && params[:duration_ids]
      @packages = Package.where("trip_to IN (?) AND agency_id IN (?) AND duration IN (?)", params[:trip_ids],params[:agency_ids], params[:duration_ids])                     
    end

    if params[:trip_ids] && params[:price_ids] && params[:duration_ids]
      @packages = Package.where("trip_to IN (?) AND price >= ? and price <= ? AND duration IN (?)", params[:trip_ids],params[:price_ids].first.to_i - 4999, params[:price_ids].last, params[:duration_ids])                     
    end
    
    if params[:agency_ids] && params[:price_ids] && params[:duration_ids]
      @packages = Package.where("agency_id IN (?) AND price >= ? and price <= ? AND duration IN (?)", params[:agency_ids], params[:price_ids].first.to_i - 4999, params[:price_ids].last ,params[:duration_ids])                     
    end

    if params[:trip_ids] && params[:agency_ids] && params[:price_ids] && params[:duration_ids]
      @packages = Package.where("trip_to IN (?) AND agency_id IN (?) AND price >= ? and price <= ? AND duration IN (?)",params[:trip_ids], params[:agency_ids], params[:price_ids].first.to_i - 4999, params[:price_ids].last ,params[:duration_ids])                     
    end

    if @packages.nil?
       #@packages = Package.all 
       @season_packs = Time.now.strftime("%m").to_i       
        if @season_packs <= 6
          @packages =Package.where(:trip_to=>"Umrah")
        else
          @packages =Package.where(:trip_to=>"Hajj")
        end
    end
    @packages = @packages.paginate(:page => params[:page], :per_page => 8)
    #respond_to do |format|
    #format.html # index.html.erb
    ##format.json { render json: @packages }
    #format.js
  #end


  end

private 

def set_filter
    @selected_trips = (params[:trip_ids].present? ? params[:trip_ids] : [])
    @selected_agencies = (params[:agency_ids].present? ? params[:agency_ids] : [])
    @selected_prices = (params[:price_ids].present? ? params[:price_ids] : [])
    @selected_durations = (params[:duration_ids].present? ? params[:duration_ids] : [])
end
end

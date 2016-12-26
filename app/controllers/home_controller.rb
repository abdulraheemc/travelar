class HomeController < ApplicationController
  def traveler_dashboard
  end

  def agent_dashboard
  end

  def home_page
  end

  def contact_us
  end

  def about_us
  end

  def book_now
    @package = Package.find params[:id]
  end


def index
  	@a = 0  
  	@agencies = Agency.all
    
    @prices = Pricelimit.select(:price)
    @durations = Package.select(:duration).distinct

    @selected_agencies = (params[:agency_ids].present? ? params[:agency_ids] : [])
    @selected_prices = (params[:price_ids].present? ? params[:price_ids] : [])
    @selected_durations = (params[:duration_ids].present? ? params[:duration_ids] : [])

   


    if params[:agency_ids]
      @packages = Package.where("agency_id IN (?)", params[:agency_ids])
    end

    if params[:price_ids]
        @packages = Package.where("price >= ? and price <= ?", params[:price_ids].first.to_i - 5000, params[:price_ids].last)
    end

    if params[:duration_ids]
      @packages = Package.where("duration IN (?)", params[:duration_ids])
    end

    if params[:agency_ids] && params[:price_ids]
      @packages = Package.where("agency_id IN (?) AND price >= ? and price <= ?", params[:agency_ids], params[:price_ids].first.to_i - 5000, params[:price_ids].last)
    end

    if params[:price_ids] && params[:duration_ids]
      @packages = Package.where("price IN (?) AND duration IN (?)", params[:price_ids], params[:duration_ids])  
    end

    if params[:agency_ids] && params[:duration_ids]
      @packages = Package.where("agency_id IN (?) AND duration IN (?)", params[:agency_ids], params[:duration_ids])
    end
    
    if params[:agency_ids] && params[:price_ids] && params[:duration_ids]
      @packages = Package.where("agency_id IN (?) AND price IN (?) AND duration IN (?)", params[:agency_ids], params[:price_ids] ,params[:duration_ids])                     
    end
    if @packages.nil?
       @packages = Package.all 
     end
    @packages = @packages.paginate(:page => params[:page], :per_page => 4)


  end
end

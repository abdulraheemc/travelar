class PilgrimController < ApplicationController
   before_action :authenticate_user!
  def new
    @package = Package.find(params[:id])
    @pilgrim = @package.pilgrims.new
    #binding.pry
  	@pilgrim.copilgrims.build
  
  end
  def show
  end
  def create
    @pilgrim = Pilgrim.new(pilgrim_params)
    if @pilgrim.save
      redirect_to payment_path(@pilgrim)
    end
     
  end

  def payment
    #binding.pry
    @data = Pilgrim.find params[:id]
    @amount = (@data.copilgrims.count + 1) * @data.package.price
    @email = @data.email
  end
   def index
   	@pilgrims = Pilgrim.all
   end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if @pilgrim.update(pilgrim_params)
        format.html { redirect_to @pilgrim, notice: 'pilgrim was successfully updated.' }
        format.json { render :show, status: :ok, location: @pilgrim }
      else
        format.html { render :edit }
        format.json { render json: @pilgrim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @pilgrim.destroy
    respond_to do |format|
      format.html { redirect_to pilgrim_url, notice: 'pilgrim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pilgrim
      @pilgrim = pilgrim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pilgrim_params
      params.require(:pilgrim).permit(:firstname,:middlename,:lastname,:passport_number,
        :gender,:age_group,:email,:mobile_number,:passport_image, :package_id, copilgrims_attributes: [:firstname, :gender, :passport_number, :mobile_number])
    end
end


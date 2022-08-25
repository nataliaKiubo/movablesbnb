class MovablesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_movable, only: %i[ show edit update destroy ]

  # GET /movables or /movables.json
  def index
    @movable = policy_scope(Movable)
    if params[:categories]
      @movables = Movable.where(categories: params[:categories])
    else
      @movables = Movable.all
    end
  end

  # GET /movables/1 or /movables/1.json
  def show
    authorize @movable
  end

  # GET /movables/new

  def new
    authorize @movable
    @movable = Movable.new
  end

  # GET /movables/1/edit
  def edit
    authorize @movable
  end

  # POST /movables or /movables.json
  def create
    @movable = Movable.new(movable_params)
    @movable.user = current_user
    authorize @movable

    respond_to do |format|
      if @movable.save
        format.html { redirect_to movable_url(@movable), notice: "Movable was successfully created." }
        format.json { render :show, status: :created, location: @movable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movables/1 or /movables/1.json
  def update
    authorize @movable
    respond_to do |format|
      if @movable.update(movable_params)
        format.html { redirect_to movable_url(@movable), notice: "Movable was successfully updated." }
        format.json { render :show, status: :ok, location: @movable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movables/1 or /movables/1.json
  def destroy
    authorize @movable
    @movable.destroy

    respond_to do |format|
      format.html { redirect_to movables_url, notice: "Movable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movable
      @movable = Movable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movable_params
      params.require(:movable).permit(:name, :description, :min_rent_time, :max_rent_time, :main_image, :stock, :price, :categories, gallery_image: [])
    end
end

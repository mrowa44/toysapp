class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :toggle_open]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all.order(:name)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @toys = @room.toys
  end

  # GET /rooms/new
  def new
    @room = Room.new
    2.times { @room.toys.build }
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_open
    @room.update(open: !@room.open)
    @rooms = Room.all.order(:name)
    respond_to do |format|
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params[:room].permit(:name, :number, toys_attributes: [:id, :name, :color,
                                                            :price, :available_num, :image, :room_id])
    end
end

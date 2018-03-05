require 'ffi/pcap'
class NewattachmentsController < ApplicationController
  before_action :set_newattachment, only: [:show, :edit, :update, :destroy]

  # GET /newattachments
  # GET /newattachments.json
  def index
    @newattachments = Newattachment.all
  end

  # GET /newattachments/1
  # GET /newattachments/1.json
  def show
    # puts @newattachment.pcap_file.url
    @pcap = "/home/radics/Plier/public"+@newattachment.pcap_file.url.split("?")[0]
    s = TCPSocket.new '0.0.0.0', 20001
    s.write @pcap
    line = s.recv(20000)
    @output = eval("["+ line.split("array")[1].split('[')[1].split(']')[0] + "]")
    @true_output = eval("["+ line.split("array")[1].split('[')[2].split(']')[0] + "]")
    puts @output.length
    puts @true_output.length
    s.close
  end

  # GET /newattachments/new
  def new
    @newattachment = Newattachment.new
  end

  # GET /newattachments/1/edit
  def edit
  end

  # POST /newattachments
  # POST /newattachments.json
  def create
    @newattachment = Newattachment.new(newattachment_params)

    respond_to do |format|
      if @newattachment.save
        format.html { redirect_to @newattachment, notice: 'Newattachment was successfully created.' }
        format.json { render :show, status: :created, location: @newattachment }
      else
        format.html { render :new }
        format.json { render json: @newattachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newattachments/1
  # PATCH/PUT /newattachments/1.json
  def update
    respond_to do |format|
      if @newattachment.update(newattachment_params)
        format.html { redirect_to @newattachment, notice: 'Newattachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @newattachment }
      else
        format.html { render :edit }
        format.json { render json: @newattachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newattachments/1
  # DELETE /newattachments/1.json
  def destroy
    @newattachment.destroy
    respond_to do |format|
      format.html { redirect_to newattachments_url, notice: 'Newattachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newattachment
      @newattachment = Newattachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newattachment_params
      params.require(:newattachment).permit(:name, :pcap_file)
    end
end

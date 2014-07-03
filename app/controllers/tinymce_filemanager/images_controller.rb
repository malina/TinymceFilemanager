# encoding: utf-8
require_dependency "tinymce_filemanager/application_controller"

module TinymceFilemanager
  class ImagesController < ApplicationController
    skip_before_filter :verify_authenticity_token

    before_action :set_picture, only: [:destroy]
    def index
      @pictures = Image.all
      respond_to do |format|
        format.json { render :json => @pictures.to_json()}
      end
    end


    def create

      @picture = []
      picture = Image.new(:image => params[:picture])
      if picture.save
        @picture.push(picture)
      else

      end
      respond_to do |format|
        format.json { render :json => @picture.to_json()}
      end
    end

     
    def destroy
      @picture.destroy
      if request.xhr?
        respond_to do |format|
          format.json { render :text => 'ok'}
        end
      else
        redirect_to edit_manage_work_path(params[:work_id])
      end
    end
      

    private

      def set_picture
        @picture = Image.find(params[:id])
      end
  end
end

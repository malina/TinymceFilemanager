# encoding: utf-8
require_dependency "tinymce_filemanager/application_controller"

module TinymceFilemanager
  class FilesController < ApplicationController
    skip_before_filter :verify_authenticity_token

    before_action :set_file, only: [:destroy]
    def index
      @files = Attach.all
      respond_to do |format|
        format.json { render :json => @files.to_json()}
      end
    end


    def create
      @file = Attach.new(:file => params[:file])
      if @file.save
      else

      end
      respond_to do |format|
        format.json { render :json => @file.to_json()}
      end
    end

     
    def destroy
      @picture.destroy
      respond_to do |format|
        format.json { render :text => 'ok'}
      end
    end

    private

      def set_file
        @picture = Attach.find(params[:id])
      end
  end
end

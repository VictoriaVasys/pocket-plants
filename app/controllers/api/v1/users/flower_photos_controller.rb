class Api::V1::Users::FlowerPhotosController < Api::V1::Users::BaseController
  skip_before_action :authorize_user

  def show
    begin
      @flower_photo = FlowerPhoto.find(params[:id])
    rescue
      render file: "public/404.html",  status: 404
    end
  end
end
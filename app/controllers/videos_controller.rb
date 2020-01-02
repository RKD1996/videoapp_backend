class VideosController < ApplicationController

  def index
    video_list = Video.all
    if video_list.present?
      render :json => {
        :videos => video_list
      },
      :status => 200
    else
      render :json => {
        :msg => "No video Found"
      }
    end
  end

  def view_count_update
    vid = Video.find_by_id(params[:id])
    vid.views = vid.views.to_i + 1
    if vid.update(:views => vid.views)
      render :json => {
        :msg => "updated"
      }
    else
      render :json => {
        :msg => "not done"
      }
    end
  end

  def video_search
    search_key = "%#{params[:keyword]}%"
    vid = Video.all.where("title LIKE ?", search_key)
    if vid.present?
      render :json => {
        :result => vid
      },
      :status => 200
    else
      render :json => {
        :msg => "No Result found"
      }
    end
  end

  private
  def search_keyword
    params.require(:keyword).permit(:keyword)
  end
end

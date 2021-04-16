class ItemsController < ApplicationController

    require 'link_thumbnailer'

    def create

        @item = Item.new item_params
        if @item.save
            redirect_to :app, notice: "Item added"
        else
            redirect_to :app, notice: "Couldn't save item"
        end
    end

    def destroy
        item = Item.find_by(id: params[:id])

        item.destroy

        redirect_to :app, notice: "Item deleted"
    end

    private

    def item_params
        if params[:item][:category] = "page"
            urlInfo = LinkThumbnailer.generate(params[:item][:url]).as_json
            newUrl = {
                "category" => params[:item][:category],
                "url" => params[:item][:url],
                "title" => urlInfo[:title],
                "favicon" => urlInfo[:favicon],
                "description" => urlInfo[:description],
                "image_src" => urlInfo[:images][0][:src]
            }
            #raise LinkThumbnailer.generate(params[:item][:url]).as_json.inspect
        else
            params.require(:item).permit(:category, :url)
        end
    end
end

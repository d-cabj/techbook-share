ActiveAdmin.register Item do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :discription, :condition, :itemImg, :category_id, :price, :postage

 index do
   # 選択した行を削除する
   selectable_column
   column :id
   column "タイトル",:title
   column "詳細",:discription
   column "状態",:condition
   column "画像",:itemImg do |item|
    if item.itemImg
      image_tag("#{item.itemImg}", size: "50x50")
    end
  end

   column "カテゴリー",:category_id
   column "税抜き価格", :price
   column "postage", :postage
   column "" do |item|
     link_to "閲覧", admin_item_path(item)
   end
   column "" do |item|
     link_to "編集", edit_admin_item_path(item)
   end
   column "" do |item|
     link_to "削除", "admin/items/#{item.id}", method: :delete, data: {confirm: "本当に削除しますか？"}
   end
  end

  show do
    attributes_table do
      row "タイトル", :title do
        "#{item.title}"
      end
      row "詳細", :disctiption do
        "#{item.discription}"
      end
      row "カテゴリー", :category_id do
        "#{item.category.name}"
      end
      row "状態", :condition do
        "#{item.condition}"
      end
      row "税抜き価格", :price do
        "#{item.price}"
      end
      row "送料", :postage do
        "#{item.postage}"
      end
      row "画像URL", :itemImg do |item|
        "#{item.itemImg}"
      end
      row "プレビュー", :itemImg do |item|
        image_tag("#{item.itemImg}", alt:"#{item.itemImg}")
      end
    end
  end
# form do |f|
#   f.inputs 'item' do
#     f.input 
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end

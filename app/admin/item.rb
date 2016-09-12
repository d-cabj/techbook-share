ActiveAdmin.register Item do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :discription, :condition, :itemImg, :category_id, :price, :postage, :admin_user_id

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

form do |f|
  f.inputs 'item' do
    # hiddenフィールドを用いる場合は書き方に注意
    f.input :admin_user_id, :as => :hidden, :input_html => { :value => "#{current_admin_user.id}" }
    f.input :title, label: "タイトル"
    # selectボックスを使う場合の書き方に注意
    f.input :category_id, :as => :select, :collection => Category.all.collect {|category| [category.name, category.id] }, label:"カテゴリー"
    f.input :discription, label:"詳細"
    # selectボックスを使う場合の書き方に注意
    f.input :condition, :as => :select, :collection => ["新品", "ほぼ新品", "非常に良い", "良い", "可", "出品不可"], label:"コンディション"
    f.input :itemImg, :as => :file, label:"画像"
    f.input :price, placeholder: "半角数字で入力してください（例：1000）", label:"本体価格（送料別）"
    f.input :postage, placeholder: "半角数字で入力してください（例：1000）", label:"送料"
  end
  actions
end


# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end

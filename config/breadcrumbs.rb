crumb :root do
  link "Home", root_path
end

crumb :item_show do
  link "商品詳細", item_path(params[:id]||params[:item_id])
  parent :root
end

crumb :order do
  link "商品購入", item_orders_path(params[:item_id])
  parent :item_show
end

crumb :item_edit do
  link "商品情報編集", edit_item_path(params[:id])
  parent :item_show
end

crumb :item_new do
  link "商品出品", new_item_path
  parent :root
end
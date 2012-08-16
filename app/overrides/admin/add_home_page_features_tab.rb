Deface::Override.new(
  virtual_path: "spree/layouts/admin", 
  partial: 'spree/admin/home_page_features/tab',
  insert_bottom: "[data-hook='admin_tabs']",
  name: 'add_home_page_features_tab')


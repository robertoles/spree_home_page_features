Deface::Override.new(
  virtual_path: 'spree/home/index',
  partial: 'spree/home_page_features/features',
  insert_top: '[data-hook=homepage_products]',
  name: 'add_home_page_features')


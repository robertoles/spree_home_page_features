module Spree
  module Admin
    class HomePageFeaturesController < Spree::Admin::ResourceController
      def model_class
        Spree::HomePageFeature
      end

      def new_object_url(options = {})
        spree.new_admin_home_page_feature_path
      end

      def edit_object_url(object, options = {})
        target = object ? object : @object
        spree.edit_admin_home_page_feature_url target
      end

      def object_url(object = nil, options = {})
        target = object ? object : @object
        spree.edit_admin_home_page_feature_url target
      end

      def collection_url(options = {})
        spree.admin_home_page_features_path
      end
    end
  end
end
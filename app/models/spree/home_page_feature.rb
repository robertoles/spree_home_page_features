module Spree
  class HomePageFeature < ActiveRecord::Base
    self.table_name = 'home_page_features'
    attr_accessible :title, :body, :publish, :style

    scope :published, where(publish: true)

    class << self
      def styles
        @styles ||= []
      end

      def styles=(styles)
        @styles = styles
      end

      def styles_dropdown
        styles.map { |s| [ s.humanize, s ] }
      end
    end
    
  end
end

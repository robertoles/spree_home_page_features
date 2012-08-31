module Spree
  class HomePageFeature < ActiveRecord::Base
    self.table_name = 'home_page_features'
    attr_accessible :body, :publish, :style, :title

    scope :published, where(publish: true)

    def style
      self.style || ""
    end

    class << self
      def styles
        @styles ||= []
      end

      def styles=(styles)
        @styles = styles
      end

      def styles_dropdown
        styles.map {|s| [s.humanize, s]}
      end
    end
  end
end
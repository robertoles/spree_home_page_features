module Spree
  class HomePageFeature < ActiveRecord::Base
    validates :title,
      presence: true,
      length: { minimum: 1 }
    validates :body,
      presence: true,
      length: { minimum: 1 },
      unless: :image
    validates_attachment_presence :image, unless: :body

    scope :published, where(publish: true)

    has_attached_file :image,
                      :url => '/spree/home_page_features/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/spree/home_page_features/:id/:style/:basename.:extension'

    belongs_to :product
    belongs_to :taxon

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

    def display_texts?
      display_body? || display_title?
    end

    def allowed_attributes
      [
       :title, :body, :publish, :style, :image, :product_id, :taxon_id,
       :image_file_name, :image_file_size, :image_content_type, :image_updated_at,
       :display_title, :display_body
      ]
    end
  end
end

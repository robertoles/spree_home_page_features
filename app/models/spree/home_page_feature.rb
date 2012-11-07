module Spree
  class HomePageFeature < ActiveRecord::Base
    self.table_name = 'home_page_features'
    attr_accessible :title, :body, :publish, :style, :image, :product_id, :taxon_id,
                    :image_file_name, :image_file_size, :image_content_type, :image_updated_at

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

    if Spree::Config[:use_s3]
      s3_creds = { :access_key_id => Spree::Config[:s3_access_key], :secret_access_key => Spree::Config[:s3_secret], :bucket => Spree::Config[:s3_bucket] }
      Spree::HomePageFeature.attachment_definitions[:image][:storage] = :s3
      Spree::HomePageFeature.attachment_definitions[:image][:s3_credentials] = s3_creds
      Spree::HomePageFeature.attachment_definitions[:image][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
      Spree::HomePageFeature.attachment_definitions[:image][:bucket] = Spree::Config[:s3_bucket]
      Spree::HomePageFeature.attachment_definitions[:image][:s3_protocol] = Spree::Config[:s3_protocol] unless Spree::Config[:s3_protocol].blank?
    end

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

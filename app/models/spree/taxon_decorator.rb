Spree::Taxon.class_eval do
  def name_with_parents
    taxons = [self]
    while taxons.last.parent
      taxons << taxons.last.parent
    end
    taxons.reverse.map(&:name).join(' > ')
  end
end
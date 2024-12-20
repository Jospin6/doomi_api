class Image < ApplicationRecord
    has_one_attached :image
    belongs_to :imageable, polymorphic: true
    validates :image, presence: true

    # Méthode pour obtenir une miniature de chaque image
    def thumbnails
        images.map { |image| image.variant(resize: "100x100").processed } if images.attached?
    end

    # Méthode pour obtenir des images de taille personnalisée
    def custom_sizes(width, height)
        images.map { |image| image.variant(resize: "#{width}x#{height}").processed } if images.attached?
    end
end
